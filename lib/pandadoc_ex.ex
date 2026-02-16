defmodule PandadocEx do
  @moduledoc """
  Documentation for `PandadocEx`.
  this  module exposes the functions to interact with the PandaDoc API
  """

  def create_document_from_template(body_params) do
    PandadocEx.Document.create_document_from_template(body_params)
  end

  def delete_document(document_id) do
    PandadocEx.Document.delete_document(document_id)
  end

  def get_document_status(document_id) do
    PandadocEx.Document.get_status(document_id)
  end

  def get_document_details(document_id) do
    PandadocEx.Document.get_details(document_id)
  end

  def send_document(document_id, body_params) do
    PandadocEx.Document.send_document(document_id, body_params)
  end

  def create_manual_reminder(document_id, body_params) do
    PandadocEx.Document.create_manual_reminder(document_id, body_params)
  end

  def change_document_status(document_id, body_params) do
    PandadocEx.Document.change_status(document_id, body_params)
  end
end
