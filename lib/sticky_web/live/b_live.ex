defmodule StickyWeb.BLive do
  use StickyWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    B<br />
    <.link navigate={~p"/a"}>Go to A</.link>
    """
  end
end
