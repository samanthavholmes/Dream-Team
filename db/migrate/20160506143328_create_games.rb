class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, index: true
      t.references :deck, index: true

      t.timestamps null: false
    end
  end
end
