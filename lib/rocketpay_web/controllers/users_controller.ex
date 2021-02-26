defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  def create(request, params) do
    params
    |> Rocketpay.create_user()
    |> handle_response(request)
  end

  defp handle_response({:ok, %User{} = user}, request) do
    request
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  # defp handle_response({:error, reason}, request) do
  #   request
  #   |> put_status(:bad_request)
  #   |> json(reason)
  # end
end
