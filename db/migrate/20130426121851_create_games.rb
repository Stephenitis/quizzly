class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user
      t.references :deck 
      t.boolean :status, :default => false
    end
    add_index :games, [:user_id, :deck_id]
  end
end
