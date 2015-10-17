defmodule TimeKeeper.PersonView do
  use TimeKeeper.Web, :view

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, TimeKeeper.PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, TimeKeeper.PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      firstName: person.firstName,
      lastName: person.lastName}
  end
end
