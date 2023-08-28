defmodule StickyWeb.ALive do
  use StickyWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    A<br />
    <.link navigate={~p"/b"}>Go to B</.link>
    """
  end
end
