defmodule AddressbookWeb.Router do
  use AddressbookWeb, :router

  alias Addressbook.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", AddressbookWeb do
    pipe_through :api

    post "/sign-up", UserController, :sign_up
    post "/sign-in", UserController, :sign_in
  end

  scope "/api/v1", AddressbookWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/users/me", UserController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AddressbookWeb.Telemetry
    end
  end
end
