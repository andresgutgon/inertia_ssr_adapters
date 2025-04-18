defmodule InertiaSsrAdapters.AcademyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InertiaSsrAdapters.Academy` context.
  """

  @doc """
  Generate a nomination.
  """
  def nomination_fixture(attrs \\ %{}) do
    {:ok, nomination} =
      attrs
      |> Enum.into(%{
        age: 42,
        gender: "some gender",
        movie: "some movie",
        name: "some name",
        won: true,
        year: 42
      })
      |> InertiaSsrAdapters.Academy.create_nomination()

    nomination
  end
end
