class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :users, :decks
      t.boolean :status
    end
  end
end
