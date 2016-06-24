defmodule DrunkenReact.PortfolioPostView do
  use DrunkenReact.Web, :view

  def render("index.json", %{portfolio_posts: portfolio_posts}) do
    %{data: render_many(portfolio_posts, DrunkenReact.PortfolioPostView, "portfolio_post.json")}
  end

  def render("show.json", %{portfolio_post: portfolio_post}) do
    %{data: render_one(portfolio_post, DrunkenReact.PortfolioPostView, "portfolio_post.json")}
  end

  def render("portfolio_post.json", %{portfolio_post: portfolio_post}) do
    %{id: portfolio_post.id,
      name: portfolio_post.name,
      image: portfolio_post.image}
  end
end
