defmodule Publisher.ArticlesTest do
  use Publisher.DataCase

  alias Publisher.Articles

  describe "pages" do
    alias Publisher.Articles.Page

    @valid_attrs %{body: "some body", slug: "some slug", title: "some title"}
    @update_attrs %{body: "some updated body", slug: "some updated slug", title: "some updated title"}
    @invalid_attrs %{body: nil, slug: nil, title: nil}

    def page_fixture(attrs \\ %{}) do
      {:ok, page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Articles.create_page()

      page
    end

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Articles.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Articles.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      assert {:ok, %Page{} = page} = Articles.create_page(@valid_attrs)
      assert page.body == "some body"
      assert page.slug == "some slug"
      assert page.title == "some title"
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      assert {:ok, page} = Articles.update_page(page, @update_attrs)
      assert %Page{} = page
      assert page.body == "some updated body"
      assert page.slug == "some updated slug"
      assert page.title == "some updated title"
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_page(page, @invalid_attrs)
      assert page == Articles.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Articles.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Articles.change_page(page)
    end
  end
end
