defmodule DrunkenReact.WidgetController do
  use DrunkenReact.Web, :controller

  alias DrunkenReact.Widget

  plug :scrub_params, "widget" when action in [:create, :update]

  def index(conn, _params) do
    widgets = Repo.all(Widget)
    render(conn, "index.json", widgets: widgets)
  end

  def create(conn, %{"widget" => widget_params}) do
    changeset = Widget.changeset(%Widget{}, widget_params)

    case Repo.insert(changeset) do
      {:ok, widget} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", widget_path(conn, :show, widget))
        |> render("show.json", widget: widget)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenReact.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    widget = Repo.get!(Widget, id)
    render(conn, "show.json", widget: widget)
  end

  def update(conn, %{"id" => id, "widget" => widget_params}) do
    widget = Repo.get!(Widget, id)
    changeset = Widget.changeset(widget, widget_params)

    case Repo.update(changeset) do
      {:ok, widget} ->
        render(conn, "show.json", widget: widget)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DrunkenReact.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    widget = Repo.get!(Widget, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(widget)

    send_resp(conn, :no_content, "")
  end
end
