defmodule InertiaSsrAdapters.AcademyTest do
  use InertiaSsrAdapters.DataCase

  alias InertiaSsrAdapters.Academy

  describe "nominations" do
    alias InertiaSsrAdapters.Academy.Nomination

    import InertiaSsrAdapters.AcademyFixtures

    @invalid_attrs %{name: nil, year: nil, age: nil, movie: nil, won: nil, gender: nil}

    test "list_nominations/0 returns all nominations" do
      nomination = nomination_fixture()
      assert Academy.list_nominations() == [nomination]
    end

    test "get_nomination!/1 returns the nomination with given id" do
      nomination = nomination_fixture()
      assert Academy.get_nomination!(nomination.id) == nomination
    end

    test "create_nomination/1 with valid data creates a nomination" do
      valid_attrs = %{name: "some name", year: 42, age: 42, movie: "some movie", won: true, gender: "some gender"}

      assert {:ok, %Nomination{} = nomination} = Academy.create_nomination(valid_attrs)
      assert nomination.name == "some name"
      assert nomination.year == 42
      assert nomination.age == 42
      assert nomination.movie == "some movie"
      assert nomination.won == true
      assert nomination.gender == "some gender"
    end

    test "create_nomination/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Academy.create_nomination(@invalid_attrs)
    end

    test "update_nomination/2 with valid data updates the nomination" do
      nomination = nomination_fixture()
      update_attrs = %{name: "some updated name", year: 43, age: 43, movie: "some updated movie", won: false, gender: "some updated gender"}

      assert {:ok, %Nomination{} = nomination} = Academy.update_nomination(nomination, update_attrs)
      assert nomination.name == "some updated name"
      assert nomination.year == 43
      assert nomination.age == 43
      assert nomination.movie == "some updated movie"
      assert nomination.won == false
      assert nomination.gender == "some updated gender"
    end

    test "update_nomination/2 with invalid data returns error changeset" do
      nomination = nomination_fixture()
      assert {:error, %Ecto.Changeset{}} = Academy.update_nomination(nomination, @invalid_attrs)
      assert nomination == Academy.get_nomination!(nomination.id)
    end

    test "delete_nomination/1 deletes the nomination" do
      nomination = nomination_fixture()
      assert {:ok, %Nomination{}} = Academy.delete_nomination(nomination)
      assert_raise Ecto.NoResultsError, fn -> Academy.get_nomination!(nomination.id) end
    end

    test "change_nomination/1 returns a nomination changeset" do
      nomination = nomination_fixture()
      assert %Ecto.Changeset{} = Academy.change_nomination(nomination)
    end
  end
end
