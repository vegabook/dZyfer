import asyncio
import time
import httpx
import datetime as dt


class Poller(): 
    def __init__(self, 
            url = "http://suprabonds.com",     # server url
            poll_secs = 2,                     # poll every 
            sub_max = 100, 
            b_id = "bloomer1"):
        self.url = url
        self.poll_secs = poll_secs
        self.sub_max = sub_max
        self.b_id = b_id
        self.sub_list = []
        self.runner_task = asyncio.create_task(self.poll_runner())

    async def dispatch(self, command, parameters = None):
        """ dispatch commands to correct place """
        if command == "ping":
            print("ping comand received", dt.datetime.utcnow())
            async with httpx.AsyncClient() as client:
                print("about to get request")
                resp = await client.get(self.url + "/api/test")
                print("got it")
                print(f"js: {resp.json()}")
        else:
            pass

    async def poll_runner(self):
        while True:
            print("runner")
            await asyncio.sleep(self.poll_secs)
            print("sending ping")
            await self.dispatch("ping")
            print("sent")


async def whatever():
    while True:
        await asyncio.sleep(0.5)
        print("----------------------------------------whateiver!")



async def main():
    asyncio.create_task(whatever())
    poller = Poller()
    while True:
        await asyncio.sleep(1)


if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())


