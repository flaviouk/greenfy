defmodule GreenfyWeb.Router do
  use GreenfyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", GreenfyWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", GreenfyWeb do
  #   pipe_through :api

  #   forward "/graphql", Absinthe.Plug, schema: Greenfy.Schema

  #   if Mix.env() == :dev do
  #     forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Greenfy.Schema
  #   end
  # end

  scope "/" do
    forward "/graph", Absinthe.Plug, schema: Greenfy.Schema

    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Greenfy.Schema
    end
  end
end
