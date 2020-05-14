defmodule LiveComponentTestWeb.ComponentPageLive.Index do
  use LiveComponentTestWeb, :live_view

  alias alias LiveComponentTestWeb.ComponentPageLive.FormComponent

  @impl true
  def mount(_params, session, socket) do
    socket = assign(socket, :form_submitted, false)

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket, FormComponent, id: :form %>

    <%= if @form_submitted do %>
      <div>Form has been submitted</div>
    <% end %>
    """
  end

  @impl true
  def handle_info({FormComponent, :form_submitted}, socket) do
    {:noreply, assign(socket, :form_submitted, true)}
  end
end