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
    PandadocEx.Document.create_document(body_params)
  end

  def delete_document(document_id) do
    PandadocEx.Document.delete_document(document_id)
  end
end
