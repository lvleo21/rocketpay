defmodule Rocketpay.User do
  """
  É como se fosse o arquivo models.py no django, só que apenas o schema
  e não tem seus comportamentos.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  """
  - Changeset é utilizado para questão das validações;
  """

  @primary_key {
    :id,
    :binary_id,
    autogenerate: true
  }

  @required_params [:name, :age, :email, :password, :username]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:username])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    #! Encriptando password
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset

end
