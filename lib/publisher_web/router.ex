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

  scope "/admin", PublisherWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AdminController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v2", PublisherWeb do
    pipe_through :api
  end
end
