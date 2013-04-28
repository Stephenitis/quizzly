class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :game
      t.references :card
      t.boolean :status
      t.timestamps
    end
    add_index :attempts, [:card_id, :game_id]
  end
end
