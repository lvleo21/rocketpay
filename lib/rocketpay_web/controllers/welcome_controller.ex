defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(request, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(request)
  end

  defp handle_response({:ok, %{result: result}}, request) do
    request
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here is yout number: #{result}"})
  end

  defp handle_response({:error, reason}, request) do
    request
    |> put_status(:bad_request)
    |> json(reason)
  end
end
