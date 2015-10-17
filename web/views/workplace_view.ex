defmodule TimeKeeper.WorkplaceView do
  use TimeKeeper.Web, :view

  def render("index.json", %{workplaces: workplaces}) do
    %{data: render_many(workplaces, TimeKeeper.WorkplaceView, "workplace.json")}
  end

  def render("show.json", %{workplace: workplace}) do
    %{data: render_one(workplace, TimeKeeper.WorkplaceView, "workplace.json")}
  end

  def render("workplace.json", %{workplace: workplace}) do
    %{id: workplace.id,
      name: workplace.name,
      location: workplace.location,
      desc: workplace.desc}
  end
end
