defmodule PublisherWeb.Router do
  use PublisherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", PublisherWeb.Admin, as: :admin do
    pipe_through :browser # Use the default browser stack

    get "/", AdminController, :index
    resources "/pages", PageController
  end

  # Other scopes may use custom stacks.
  scope "/api/v2", PublisherWeb do
    pipe_through :api
    resources "/pages", PageController, except: [:new, :edit, :delete]
  end
end
