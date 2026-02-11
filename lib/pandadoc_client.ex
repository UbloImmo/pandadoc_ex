defmodule PandadocEx.Client do
  use Tesla

  def get_client(bearer_token) do
    middleware = [
      {Tesla.Middleware.Headers, [{"authorization", "API-key #{bearer_token}"}]},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger
    ]

    adapter = {Tesla.Adapter.Hackney, [recv_timeout: 30000]}

    Tesla.client(middleware, adapter)
  end
end
