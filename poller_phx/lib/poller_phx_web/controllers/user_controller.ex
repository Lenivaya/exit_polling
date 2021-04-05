defmodule PollerPhxWeb.UserController do
  use PollerPhxWeb, :controller

  alias PollerDal.Users
  alias PollerDal.Users.User

  def new(conn, _params) do
    changeset = User.registration_changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, user_params) do
    case Users.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created succesfully")
        |> redirect(to: Routes.auth_path(conn, :new))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
