defmodule PublisherWeb.PageView do
  use PublisherWeb, :view
  alias PublisherWeb.PageView

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{id: page.id,
      title: page.title,
      body: page.body,
      slug: page.slug}
  end
end
