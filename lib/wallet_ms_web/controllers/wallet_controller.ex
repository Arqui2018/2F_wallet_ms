defmodule WalletMsWeb.WalletController do
  use WalletMsWeb, :controller

  alias WalletMs.ApiWallet
  alias WalletMs.ApiWallet.Wallet

  action_fallback WalletMsWeb.FallbackController

  def index(conn, _params) do
    wallets = ApiWallet.list_wallets()
    render(conn, "index.json", wallets: wallets)
  end

  def create(conn, wallet_params) do
    wallet = %{"wallet" => wallet_params}
    with {:ok, %Wallet{} = wallet} <- ApiWallet.create_wallet(wallet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", wallet_path(conn, :show, wallet))
      |> render("show.json", wallet: wallet)
    end
  end

  def show(conn, %{"id" => id}) do
    wallet = ApiWallet.get_wallet!(id)
    render(conn, "show.json", wallet: wallet)
  end

  require Logger

  def update(conn, %{"balance" => wallet_params, "id" => id}) do

    wallet = ApiWallet.get_wallet!(id)
    wallet_params = %{ "balance" => wallet_params + wallet.balance }

    with {:ok, %Wallet{} = wallet} <- ApiWallet.update_wallet(wallet, wallet_params) do
      render(conn, "show.json", wallet: wallet)
    end
  end

  def delete(conn, %{"id" => id}) do
    wallet = ApiWallet.get_wallet!(id)
    with {:ok, %Wallet{}} <- ApiWallet.delete_wallet(wallet) do
      render(conn, "show.json", wallet: wallet)
    end
  end
end
