defmodule DrunkenReact.PageController do
  use DrunkenReact.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
