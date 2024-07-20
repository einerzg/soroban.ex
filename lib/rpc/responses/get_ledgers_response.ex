defmodule Soroban.RPC.GetLedgersResponse do
  @moduledoc """
  `GetLedgersResponse` struct definition.
  """

  @behaviour Soroban.RPC.Response.Spec

  @type ledgers :: list(map())
  @type latest_ledger :: non_neg_integer()
  @type latest_ledger_close_timestamp :: String.t()
  @type oldest_ledger :: non_neg_integer()
  @type oldest_ledger_close_timestamp :: String.t()
  @type cursor :: String.t()

  @type t :: %__MODULE__{
          ledgers: ledgers(),
          latest_ledger: latest_ledger(),
          latest_ledger_close_timestamp: latest_ledger_close_timestamp(),
          oldest_ledger: oldest_ledger(),
          oldest_ledger_close_timestamp: oldest_ledger_close_timestamp(),
          cursor: cursor()
        }

  defstruct [
    :ledgers,
    :latest_ledger,
    :latest_ledger_close_timestamp,
    :oldest_ledger,
    :oldest_ledger_close_timestamp,
    :cursor
  ]

  @impl true
  def new(attrs), do: struct(%__MODULE__{}, attrs)
end
