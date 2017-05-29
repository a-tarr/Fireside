defmodule Fireside.Router do
  use Fireside.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Fireside do
    pipe_through :api
  end
end
