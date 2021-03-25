defmodule PollerDal.Choices.Choice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "choices" do
    field(:description, :string)
    field(:party, :string)
    belongs_to(:question, PollerDal.Questions.Question)

    timestamps()
  end

  def changeset(question, attrs) do
    question
    |> cast(attrs, [:description, :question_id, :party])
    |> validate_required([:description, :question_id, :party])
    |> assoc_constraint(:question)
  end
end
