defmodule PandadocEx do
  @moduledoc """
  Documentation for `PandadocEx`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PandadocEx.hello()
      :world

  """
  def hello do
    :world
  end

  def create_document(body_params) do
    api_key = Application.get_env(:pandadoc_ex, :api_key)

    client = PandadocEx.Client.get_client(api_key)

    url = Application.get_env(:pandadoc_ex, :api_url)

    with Tesla.post(client, "#{url}/documents", body_params) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, body}
      {:ok, %Tesla.Env{status: status, body: body}} ->
        {:error, body}
    end
  end
end
