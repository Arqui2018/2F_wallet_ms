defmodule WalletMsWeb.WalletView do
  use WalletMsWeb, :view
  alias WalletMsWeb.WalletView

  def render("index.json", %{wallets: wallets}) do
    render_many(wallets, WalletView, "wallet.json")
  end

  def render("show.json", %{wallet: wallet}) do
    render_one(wallet, WalletView, "wallet.json")
  end

  def render("wallet.json", %{wallet: wallet}) do
    %{id: wallet.id,
      balance: wallet.balance}
  end
end
