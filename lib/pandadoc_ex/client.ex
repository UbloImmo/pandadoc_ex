defmodule PandadocEx.Client do
  use Tesla

  def get_client() do
    bearer_token = Application.get_env(:pandadoc_ex, :api_key)

    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.pandadoc.com/public"},
      {Tesla.Middleware.Headers, [{"authorization", "API-key #{bearer_token}"}]},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger
    ]

    adapter = {Tesla.Adapter.Hackney, [recv_timeout: 30000]}

    Tesla.client(middleware, adapter)
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
end
