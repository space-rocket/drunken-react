defmodule DrunkenReact.PortfolioPostTest do
  use DrunkenReact.ModelCase

  alias DrunkenReact.PortfolioPost

  @valid_attrs %{image: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PortfolioPost.changeset(%PortfolioPost{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PortfolioPost.changeset(%PortfolioPost{}, @invalid_attrs)
    refute changeset.valid?
  end
end
