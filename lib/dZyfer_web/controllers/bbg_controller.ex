defmodule DZyferWeb.BbgController do
  use DZyferWeb, :controller

  def ping(conn, params) do
    IO.puts("<---------------->")
    IO.inspect params
    json(conn, %{data: params}) 
    conn
    |> put_status(:ok)
    |> send_resp(200, "ok")
  end

end
