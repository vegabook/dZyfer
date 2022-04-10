defmodule DZyferWeb.PageController do
  use DZyferWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
