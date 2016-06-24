defmodule DrunkenReact.PortfolioPostController do
  use DrunkenReact.Web, :controller

  alias DrunkenReact.PortfolioPost

  plug :scrub_params, "portfolio_post" when action in [:create, :update]

  def index(conn, _params) do
    portfolio_posts = Repo.all(PortfolioPost)
    render(conn, "index.json", portfolio_posts: portfolio_posts)
  end

  def create(conn, %{"portfolio_post" => portfolio_post_params}) do
    changeset = PortfolioPost.changeset(%PortfolioPost{}, portfolio_post_params)

    case Repo.insert(changeset) do
      {:ok, portfolio_post} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", portfolio_post_path(conn, :show, portfolio_post))
        |> render("show.json", portfolio_post: portfolio_post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenReact.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    portfolio_post = Repo.get!(PortfolioPost, id)
    render(conn, "show.json", portfolio_post: portfolio_post)
  end

  def update(conn, %{"id" => id, "portfolio_post" => portfolio_post_params}) do
    portfolio_post = Repo.get!(PortfolioPost, id)
    changeset = PortfolioPost.changeset(portfolio_post, portfolio_post_params)

    case Repo.update(changeset) do
      {:ok, portfolio_post} ->
        render(conn, "show.json", portfolio_post: portfolio_post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenReact.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    portfolio_post = Repo.get!(PortfolioPost, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(portfolio_post)

    send_resp(conn, :no_content, "")
  end
end
