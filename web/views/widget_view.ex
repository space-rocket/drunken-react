defmodule DrunkenReact.WidgetView do
  use DrunkenReact.Web, :view

  def render("index.json", %{widgets: widgets}) do
    %{data: render_many(widgets, DrunkenReact.WidgetView, "widget.json")}
  end

  def render("show.json", %{widget: widget}) do
    %{data: render_one(widget, DrunkenReact.WidgetView, "widget.json")}
  end

  def render("widget.json", %{widget: widget}) do
    %{id: widget.id,
      name: widget.name}
  end
end
