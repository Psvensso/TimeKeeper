defmodule TimeKeeper.CustomerView do
  use TimeKeeper.Web, :view

  def render("index.json", %{customers: customers}) do
    %{data: render_many(customers, TimeKeeper.CustomerView, "customer.json")}
  end

  def render("show.json", %{customer: customer}) do
    %{data: render_one(customer, TimeKeeper.CustomerView, "customer.json")}
  end

  def render("customer.json", %{customer: customer}) do
    %{id: customer.id,
      name: customer.name,
      desc: customer.desc,
      workplace_id: customer.workplace_id}
  end
end
