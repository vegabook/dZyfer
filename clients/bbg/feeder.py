# feeder fo dZyfer from bloomberg using websocket
import time
import pathlib
import sys

api_path = pathlib.Path(__file__).parent.resolve() / "examples" / "demoapps"

sys.path.append(str(api_path))

from argparse import ArgumentParser, RawTextHelpFormatter

from examples.demoapps.util.SubscriptionOptions import \
    addSubscriptionOptions, \
    setSubscriptionSessionOptions, \
    createSubscriptionList

from examples.demoapps.util.ConnectionAndAuthOptions import \
    addConnectionAndAuthOptions, \
    createSessionOptions

from blpapi_import_helper import blpapi

DEFAULT_QUEUE_SIZE = 10000

from examples.demoapps.SubscriptionExample import SubscriptionEventHandler, parseCmdLine


def main():
    options = parseCmdLine()
    options.fields = ["LAST_PRICE"]

    sessionOptions = createSessionOptions(options)
    setSubscriptionSessionOptions(sessionOptions, options)
    sessionOptions.setMaxEventQueueSize(options.eventQueueSize)
    handler = SubscriptionEventHandler()
    session = blpapi.Session(sessionOptions, handler.processEvent)

    options.topics = ["JPY Curncy"]
    options.interval = 5

    try:
        if not session.start():
            print("Failed to start session.")
            return

        if not session.openService(options.service):
            print("Failed to open service.")
            return

        subscriptions = createSubscriptionList(options)
        session.subscribe(subscriptions)

        print("Press ENTER to quit")
        input()

    finally:
        session.stop()


if __name__ == "__main__":
    try:
        main()
    except Exception as e:  # pylint: disable=broad-except
        print(e)

__copyright__ = """
Copyright 2021, Bloomberg Finance L.P.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:  The above
copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
"""

