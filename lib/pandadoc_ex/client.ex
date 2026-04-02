defmodule PandadocEx.Client do
  use Tesla

  @hackney_adapter {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}

  def get_client() do
    middleware =
      common_middleware() ++
        [
          Tesla.Middleware.JSON,
          Tesla.Middleware.Logger
        ]

    Tesla.client(middleware, @hackney_adapter)
  end

  def download_document(document_id) do
    middleware = common_middleware() ++ [Tesla.Middleware.Logger]
    client = Tesla.client(middleware, @hackney_adapter)
    path = "/v1/documents/#{document_id}/download"

    case Tesla.get(client, path) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Tesla.Env{status: status}} ->
        {:error, "Pandadoc HTTP #{status}"}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def send_request(url_path, method, body_params) do
    client = get_client()

    case Tesla.request(client, method: method, url: url_path, body: body_params) do
      {:ok, %Tesla.Env{status: status, body: body}} when status in 200..299 ->
        {:ok, body}

      {:ok, %Tesla.Env{status: _status, body: body}} ->
        {:error, body}
    end
  end

  defp common_middleware() do
    bearer_token = Application.get_env(:pandadoc_ex, :api_key)

    [
      {Tesla.Middleware.BaseUrl, "https://api.pandadoc.com/public"},
      {Tesla.Middleware.Headers, [{"authorization", "API-key #{bearer_token}"}]}
    ]
  end
end
