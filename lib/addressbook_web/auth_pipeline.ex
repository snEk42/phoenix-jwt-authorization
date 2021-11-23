defmodule Addressbook.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :addressbook,
    module: Addressbook.Guardian,
    error_handler: Addressbook.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
