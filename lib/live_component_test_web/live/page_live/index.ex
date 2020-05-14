defmodule LiveComponentTestWeb.PageLive.Index do
  use LiveComponentTestWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    socket = assign(socket, :form_submitted, false)

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <form action="#" phx-submit="submit">
      <button type="submit">Submit</button>
    </form>

    <%= if @form_submitted do %>
      <div>Form has been submitted</div>
    <% end %>
    """
  end

  @impl true
  def handle_event("submit", _, socket) do
    {:noreply, assign(socket, :form_submitted, true)}
  end
end