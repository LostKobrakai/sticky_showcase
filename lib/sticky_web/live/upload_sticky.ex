defmodule StickyWeb.UploadSticky do
  use StickyWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="my-4" phx-drop-target={@uploads.file.ref}>
      <.form for={nil} phx-change="validate">
        <div>
          <.live_file_input upload={@uploads.file} />
        </div>
        <ol class="space-y-4">
          <li :for={entry <- @uploads.file.entries}>
            <b><%= entry.client_name %></b> <br />
            <progress class="w-full" value={entry.progress} max="100">
              <%= entry.progress %>%
            </progress>
          </li>
        </ol>
      </.form>
    </div>
    """
  end

  @impl true
  def mount(_, _, socket) do
    socket =
      allow_upload(socket, :file,
        accept: :any,
        max_entries: 1,
        auto_upload: true,
        max_file_size: 1_000_000_000
      )

    {:ok, socket, layout: false}
  end

  @impl true
  def handle_event("validate", _, socket) do
    {:noreply, socket}
  end
end
