defmodule PublisherWeb.AdminController do
  use PublisherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
