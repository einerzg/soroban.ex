defmodule Soroban.RPC.GetLedgers do
  @moduledoc """
  GetLedgers request implementation for Soroban RPC.
  """
  @behaviour Soroban.RPC.Endpoint.Spec

  alias Soroban.RPC.{GetLedgersResponse, Request, LedgerTransactionsPayload}

  @endpoint "getLedgers"

  @impl true
  def request(server, %LedgerTransactionsPayload{} = ledgers_payload) do
    payload = LedgerTransactionsPayload.to_request_args(ledgers_payload)

    server
    |> Request.new(@endpoint)
    |> Request.add_headers([{"Content-Type", "application/json"}])
    |> Request.add_params(payload)
    |> Request.perform()
    |> Request.results(as: GetLedgersResponse)
  end
end
