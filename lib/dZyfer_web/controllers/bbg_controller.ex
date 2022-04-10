defmodule DZyferWeb.BbgController do
  use DZyferWeb, :controller

  def data(conn, params) do
    IO.puts("<------data------->")
    IO.inspect params
    json(conn, %{data: params}) 
    conn
    |> put_status(:ok)
    |> send_resp(200, "ok")
  end

  def ping(conn, _params) do
    IO.puts("<------ping------->")
    json(conn, %{time: :os.system_time(:milli_seconds)}) 
    conn
    |> put_status(:ok)
    |> send_resp(200, "ok")
  end

end
