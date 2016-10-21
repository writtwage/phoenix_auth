defmodule PhoenixAuth.PageController do
  use PhoenixAuth.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
