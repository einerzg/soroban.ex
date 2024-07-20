defmodule Soroban.RPC.Endpoint.Spec do
  @moduledoc """
  Specifies the callbacks to build the Soroban's endpoints.
  """

  alias Soroban.RPC.{Error, EventsPayload, HTTPError, Server, LedgerTransactionsPayload}

  @type response :: {:ok, struct()} | {:error, Error.t() | HTTPError.t()}
  @type params :: String.t() | EventsPayload.t() | keyword() | nil | LedgerTransactionsPayload.t()

  @callback request(server :: Server.t(), params :: params()) :: response()
end
