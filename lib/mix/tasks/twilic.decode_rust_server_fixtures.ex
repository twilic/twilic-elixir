defmodule Mix.Tasks.Twilic.DecodeRustServerFixtures do
  @shortdoc "Decode Rust server interop fixture frames from stdin"
  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Mix.Task.run("app.start")

    input =
      case IO.read(:stdio, :all) do
        :eof -> ""
        data -> data
      end

    Twilic.InteropFixtures.decode_rust_server_frames(input)
  end
end
