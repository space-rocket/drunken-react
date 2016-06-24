defmodule DrunkenReact.PortfolioPostControllerTest do
  use DrunkenReact.ConnCase

  alias DrunkenReact.PortfolioPost
  @valid_attrs %{image: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, portfolio_post_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    portfolio_post = Repo.insert! %PortfolioPost{}
    conn = get conn, portfolio_post_path(conn, :show, portfolio_post)
    assert json_response(conn, 200)["data"] == %{"id" => portfolio_post.id,
      "name" => portfolio_post.name,
      "image" => portfolio_post.image}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, portfolio_post_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, portfolio_post_path(conn, :create), portfolio_post: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(PortfolioPost, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, portfolio_post_path(conn, :create), portfolio_post: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    portfolio_post = Repo.insert! %PortfolioPost{}
    conn = put conn, portfolio_post_path(conn, :update, portfolio_post), portfolio_post: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(PortfolioPost, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    portfolio_post = Repo.insert! %PortfolioPost{}
    conn = put conn, portfolio_post_path(conn, :update, portfolio_post), portfolio_post: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    portfolio_post = Repo.insert! %PortfolioPost{}
    conn = delete conn, portfolio_post_path(conn, :delete, portfolio_post)
    assert response(conn, 204)
    refute Repo.get(PortfolioPost, portfolio_post.id)
  end
end
