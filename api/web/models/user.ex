defmodule Fireside.User do
  use Fireside.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_length(:password, min: 4)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.BCrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end 

end
