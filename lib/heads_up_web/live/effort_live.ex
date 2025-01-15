defmodule HeadsUpWeb.EffortLive do
  use HeadsUpWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "MOUNT")

    socket =
      socket
      |> assign(responders: 0, minutes_per_responder: 10)

    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(self(), label: "RENDER")
    ~H"""
    <div class="effort">
      <h1>Community Love</h1>
      <section>
        <button phx-click="add" phx-value-quantity="3">+ 3</button>
        <div>
          {@responders}
        </div>
        &times;
        <div>
          {@minutes_per_responder}
        </div>
        =
        <div>
          {@responders * @minutes_per_responder}
        </div>
      </section>
    </div>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    IO.inspect(self(), label: "HANDLE EVENT")

    raise "💥"

    socket =
      update(socket, :responders, fn current_quantity ->
        current_quantity + String.to_integer(quantity)
      end)

    {:noreply, socket}
  end
end
