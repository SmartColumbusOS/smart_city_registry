defmodule SmartCity.Dataset do
  @moduledoc """
  Struct defining a registry event message.
  """
  alias SmartCity.Dataset.Business
  alias SmartCity.Helpers
  alias SmartCity.Dataset.Technical

  @derive Jason.Encoder
  defstruct [:id, :business, :technical]

  @doc """
  Returns a new `SmartCity.Dataset` struct. `SmartCity.Dataset.Business` and
  `SmartCity.Dataset.Technical` structs will be created along the way.

  Can be created from:
  - map with string keys
  - map with atom keys
  - JSON
  """
  def new(msg) when is_binary(msg) do
    with {:ok, decoded} <- Jason.decode(msg, keys: :atoms) do
      new(decoded)
    end
  end

  def new(%{"id" => _} = msg) do
    msg
    |> Helpers.to_atom_keys()
    |> new()
  end

  def new(%{id: id, business: biz, technical: tech}) do
    struct =
      struct(%__MODULE__{}, %{
        id: id,
        business: Business.new(biz),
        technical: Technical.new(tech)
      })

    {:ok, struct}
  rescue
    e -> {:error, e}
  end

  def new(msg) do
    {:error, "Invalid registry message: #{inspect(msg)}"}
  end

  @doc """
  Returns an `:ok` tuple with a JSON encoded registry message. Returns error tuple if message can't be encoded.

  Function throws an `ArgumentError` if it doesn't receive a `SmartCity.Dataset`.
  """
  def encode(%__MODULE__{} = msg) do
    with {:ok, _} = encoded <- Jason.encode(msg) do
      encoded
    else
      {:error, _} -> {:error, "Cannot encode message: #{inspect(msg)}"}
    end
  end

  def encode(msg) do
    {:error, "Message must be a #{inspect(__MODULE__)} struct: #{inspect(msg)}"}
  end

  @doc """
  Returns JSON encoded registry message. Throws `Jason.EncodeError` if message can't be encoded.

  Function throws an `ArgumentError` if it doesn't receive a `SmartCity.Dataset`.
  """
  def encode!(%__MODULE__{} = msg) do
    Jason.encode!(msg)
  end

  def encode!(msg) do
    with {:error, reason} <- encode(msg) do
      raise ArgumentError, reason
    end
  end
end
