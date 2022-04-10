defmodule DstreamsWeb.PageController do
  use DstreamsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def bbgtickers(conn, _params) do
    render(conn, "bbg.html")
  end
end

  
