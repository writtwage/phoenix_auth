defmodule PhoenixAuth.RegistrationController do
  use PhoenixAuth.Web, :controller

  alias PhoenixAuth.User

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(PhoenixAuth.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixAuth.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
