defmodule DstreamsWeb.Api.BbgController do
  use DstreamsWeb, :controller

  def update(conn, params) do
    # this is where commands come in
    IO.puts("================")
    IO.inspect params
    json(conn, %{data: "pong", params: params}) 
    conn
    |> put_status(:ok)
    |> send_resp(200, "ok")
  end

  # example code
  def post_example(conn, params) do
    # this is where commands come in
    IO.puts("update update update")
    IO.inspect params
    json(conn, %{data: "yabadadoo"}) 
    conn
    |> put_status(:ok)
    |> send_resp(200, "ok")
  end

end
      




