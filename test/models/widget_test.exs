defmodule DrunkenReact.WidgetTest do
  use DrunkenReact.ModelCase

  alias DrunkenReact.Widget

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Widget.changeset(%Widget{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Widget.changeset(%Widget{}, @invalid_attrs)
    refute changeset.valid?
  end
end
