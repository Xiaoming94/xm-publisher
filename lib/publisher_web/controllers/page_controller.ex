defmodule PublisherWeb.PageController do
  use PublisherWeb, :controller

  alias Publisher.Articles
  alias Publisher.Articles.Page

  action_fallback PublisherWeb.FallbackController

  def index(conn, _params) do
    pages = Articles.list_pages()
    render(conn, "index.json", pages: pages)
  end

  def create(conn, %{"page" => page_params}) do
    with {:ok, %Page{} = page} <- Articles.create_page(page_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", page_path(conn, :show, page))
      |> render("show.json", page: page)
    end
  end

  def show(conn, %{"id" => id}) do
    page = Articles.get_page!(id)
    render(conn, "show.json", page: page)
  end

  def update(conn, %{"id" => id, "page" => page_params}) do
    page = Articles.get_page!(id)

    with {:ok, %Page{} = page} <- Articles.update_page(page, page_params) do
      render(conn, "show.json", page: page)
    end
  end

  def delete(conn, %{"id" => id}) do
    page = Articles.get_page!(id)
    with {:ok, %Page{}} <- Articles.delete_page(page) do
      send_resp(conn, :no_content, "")
    end
  end
end
