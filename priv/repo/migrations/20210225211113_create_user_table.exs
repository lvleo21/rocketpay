defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    #! Para criar uma tabela basta digitar: create table :nome_da_tabela
    create table :users do
      #! Para adicionar as colunas da tabela basta digitar: add :nome_do_atributo, :tipo
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :username, :string

      #! O timestamps gera duas colunas: inserted_at e update_at
      #! Momento que o registro foi inserido e/ou atualizado
      timestamps()
    end

    #! Para definir algum campo como único/exclusivo
    #! Basta digitar o comando: create unique_index(:tabela, [:email])
    #! Será que não tem como botar os atributos em uma mesma lista ?
    create unique_index(:users, [:email])
    create unique_index(:users, [:username])

  end
end

"""
O comando mix 'ecto.gen.migration nome_da_migration' é para criar uma migration
"""
