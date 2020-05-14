defmodule LiveComponentTestWeb.ComponentPageLive.FormComponent do
  use LiveComponentTestWeb, :live_component

  alias LiveComponentTestWeb.ComponentPageLive.FormComponent

  @impl true
  def render(assigns) do
    ~L"""
    <form action="#" phx-submit="submit" phx-target="<%= @myself %>">
      <button type="submit">Submit</button>
    </form>
    """
  end

  @impl true
  def handle_event("submit", _, socket) do
    send(self(), {FormComponent, :form_submitted})
    {:noreply, socket}
  end

end
