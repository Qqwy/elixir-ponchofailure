defmodule WebinterfaceWeb.PageController do
  use WebinterfaceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
