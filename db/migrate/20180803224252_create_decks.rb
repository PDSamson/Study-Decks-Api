class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :title
      t.string :answer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
