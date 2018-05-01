defmodule WalletMs.Repo.Migrations.CreateWallets do
  use Ecto.Migration

  def change do
    create table(:wallets) do
      add :balance, :integer

      timestamps()
    end

  end
end
