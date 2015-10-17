defmodule TimeKeeper.TimeRegistrationView do
  use TimeKeeper.Web, :view

  def render("index.json", %{time_registrations: time_registrations}) do
    %{data: render_many(time_registrations, TimeKeeper.TimeRegistrationView, "time_registration.json")}
  end

  def render("show.json", %{time_registration: time_registration}) do
    %{data: render_one(time_registration, TimeKeeper.TimeRegistrationView, "time_registration.json")}
  end

  def render("time_registration.json", %{time_registration: time_registration}) do
    %{id: time_registration.id,
      in: time_registration.in,
      out: time_registration.out}
  end
end
