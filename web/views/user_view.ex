defmodule PhoenixAuth.UserView do
  use PhoenixAuth.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PhoenixAuth.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PhoenixAuth.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash}
  end
end
