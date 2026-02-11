import Config



config :pandadoc_ex,
  api_key: System.get_env("PANDADOC_API_KEY"),
  api_url: System.get_env("PANDADOC_API_URL")
