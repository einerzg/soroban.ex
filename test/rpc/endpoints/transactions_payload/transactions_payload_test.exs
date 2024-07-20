defmodule Soroban.RPC.LedgerTransactionsPayloadTest do
  use ExUnit.Case
  alias Soroban.RPC.LedgerTransactionsPayload

  setup do
    start_ledger = 674_736
    cursor = "1234-1"
    limit = 2

    payload =
      LedgerTransactionsPayload.new(
        start_ledger: start_ledger,
        cursor: cursor,
        limit: limit
      )

    %{
      start_ledger: start_ledger,
      cursor: cursor,
      limit: limit,
      payload: payload
    }
  end

  describe "new/1" do
    test "with valid values", %{
      start_ledger: start_ledger,
      cursor: cursor,
      limit: limit
    } do
      %LedgerTransactionsPayload{
        start_ledger: ^start_ledger,
        pagination: %{cursor: ^cursor, limit: ^limit}
      } =
        LedgerTransactionsPayload.new(
          start_ledger: start_ledger,
          cursor: cursor,
          limit: limit
        )
    end

    test "with invalid struct" do
      assert LedgerTransactionsPayload.new(nil) == {:error, :invalid_args}
    end

    test "with nil start_ledger", %{
      cursor: cursor,
      limit: limit
    } do
      %LedgerTransactionsPayload{
        start_ledger: nil,
        pagination: %{cursor: ^cursor, limit: ^limit}
      } =
        LedgerTransactionsPayload.new(
          start_ledger: nil,
          cursor: cursor,
          limit: limit
        )
    end

    test "with nil cursor", %{
      start_ledger: start_ledger,
      limit: limit
    } do
      %LedgerTransactionsPayload{
        start_ledger: ^start_ledger,
        pagination: %{cursor: nil, limit: ^limit}
      } =
        LedgerTransactionsPayload.new(
          start_ledger: start_ledger,
          cursor: nil,
          limit: limit
        )
    end

    test "with nil limit", %{
      start_ledger: start_ledger,
      cursor: cursor
    } do
      %LedgerTransactionsPayload{
        start_ledger: ^start_ledger,
        pagination: %{cursor: ^cursor, limit: nil}
      } =
        LedgerTransactionsPayload.new(
          start_ledger: start_ledger,
          cursor: cursor,
          limit: nil
        )
    end
  end

  describe "to_request_args/1" do
    test "with valid struct", %{
      start_ledger: start_ledger,
      cursor: cursor,
      limit: limit,
      payload: payload
    } do
      expected = %{
        startLedger: start_ledger,
        filters: nil,
        pagination: %{cursor: cursor, limit: limit}
      }

      assert LedgerTransactionsPayload.to_request_args(payload) == expected
    end

    test "with an invalid struct" do
      assert LedgerTransactionsPayload.to_request_args(nil) == :error
    end
  end
end
