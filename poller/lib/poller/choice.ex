defmodule Poller.Choice do
  alias __MODULE__

  defstruct(
    id: nil,
    description: nil,
    perty: nil
  )

  def new(id, description, party) do
    %Choice{
      id: id,
      description: description,
      party: party
    }
  end
end
