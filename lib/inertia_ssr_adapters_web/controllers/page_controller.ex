defmodule InertiaSsrAdaptersWeb.PageController do
  use InertiaSsrAdaptersWeb, :controller

  alias InertiaSsrAdapters.Academy

  def home(conn, _params) do
    ssr = true

    conn
    |> assign_prop(:ssr, ssr)
    |> assign_prop(:nominations, nominations())
    |> render_inertia("HomePage", ssr: ssr)
  end

  defp nominations() do
    Academy.list_nominations()
    |> Enum.map(fn n ->
      %{
        id: n.id,
        name: n.name,
        age: n.age,
        gender: n.gender,
        year: n.year,
        movie: n.movie,
        won: n.won
      }
    end)
  end
end
