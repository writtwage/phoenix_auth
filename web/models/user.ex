defmodule PhoenixAuth.User do
  use PhoenixAuth.Web, :model

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  @required_fields ~w(email password)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 5)
    |> hash_password
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      changeset
      |> put_change(:password_hash, Comeonin.Bcrypt.hashpwsalt(password))
    else
      changeset
    end
  end
end
