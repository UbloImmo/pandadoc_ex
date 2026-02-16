defmodule PandadocEx.Document do
  alias PandadocEx.Client, as: PandadocAPI

  def create_document_from_template(body_params) do
    PandadocAPI.send_request("/v1/documents", :post, body_params)
  end

  def delete_document(document_id) do
    PandadocAPI.send_request("/v1/documents/#{document_id}", :delete, %{})
  end

  def get_status(document_id) do
    PandadocAPI.send_request("/v1/documents/#{document_id}", :get, %{})
  end

  def get_details(document_id) do
    PandadocAPI.send_request("/v1/documents/#{document_id}/details", :get, %{})
  end

  def send_document(document_id, body_params) do
    PandadocAPI.send_request("/v1/documents/#{document_id}/send", :post, body_params)
  end

  def create_manual_reminder(document_id, body_params) do
    PandadocAPI.send_request("/v1/documents/#{document_id}/send-reminder", :post, body_params)
  end

  def change_status(document_id, body_params) do
    PandadocAPI.send_request("/v1/documents/#{document_id}/status", :patch, body_params)
  end
end
