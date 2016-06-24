defmodule DrunkenReact.WidgetControllerTest do
  use DrunkenReact.ConnCase

  alias DrunkenReact.Widget
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, widget_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    widget = Repo.insert! %Widget{}
    conn = get conn, widget_path(conn, :show, widget)
    assert json_response(conn, 200)["data"] == %{"id" => widget.id,
      "name" => widget.name}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, widget_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, widget_path(conn, :create), widget: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Widget, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, widget_path(conn, :create), widget: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    widget = Repo.insert! %Widget{}
    conn = put conn, widget_path(conn, :update, widget), widget: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Widget, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    widget = Repo.insert! %Widget{}
    conn = put conn, widget_path(conn, :update, widget), widget: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    widget = Repo.insert! %Widget{}
    conn = delete conn, widget_path(conn, :delete, widget)
    assert response(conn, 204)
    refute Repo.get(Widget, widget.id)
  end
end
