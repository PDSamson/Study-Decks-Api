class AddAnswerToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :answer, :string
  end
end
