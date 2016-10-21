defmodule PhoenixAuth.UserTest do
  use PhoenixAuth.ModelCase

  alias PhoenixAuth.User

  @valid_attrs %{email: "some content", password_hash: "some content", password: "some content"}
  @invalid_attrs %{}

  # test "changeset with valid attributes" do
  #   changeset = User.changeset(%User{}, @valid_attrs)
  #   assert changeset.valid?
  # end
  #
  # test "changeset with invalid attributes" do
  #   changeset = User.changeset(%User{}, @invalid_attrs)
  #   refute changeset.valid?
  # end
  test "password_hash value gets set to a hash" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert Comeonin.Bcrypt.checkpw(@valid_attrs.password, Ecto.Changeset.get_change(changeset, :password_hash))
  end
end
