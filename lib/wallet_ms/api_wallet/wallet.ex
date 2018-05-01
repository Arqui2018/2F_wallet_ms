defmodule WalletMs.ApiWallet.Wallet do
  use Ecto.Schema
  import Ecto.Changeset


  schema "wallets" do
    field :balance, :integer

    timestamps()
  end

  @doc false
  def changeset(wallet, attrs) do
    wallet
    |> cast(attrs, [:balance])
    |> validate_required([:balance])
  end
end
