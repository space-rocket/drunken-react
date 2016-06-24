defmodule DrunkenReact.Router do
  use DrunkenReact.Web, :router

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

  scope "/", DrunkenReact do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :index
    get "/widgets", PageController, :index
    get "/portfolio-items", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", DrunkenReact do
    pipe_through :api
    resources "/widgets", WidgetController, except: [:new, :edit]
    resources "/portfolio_posts", PortfolioPostController, except: [:new, :edit]
  end
end
