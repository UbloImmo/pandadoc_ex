defmodule PandadocEx.Document do
  alias PandadocEx.Client, as: PandadocAPI


  def create_document(body_params) do
    PandadocAPI.send_request("/v1/documents", :post, body_params)
  end

  def delete_document(document_id) do
    PandadocAPI.send_request("/v1/documents/#{document_id}", :delete, %{})
  end
end
