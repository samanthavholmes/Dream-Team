class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.boolean :correct, default: false
      t.references :card, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
  end
end
