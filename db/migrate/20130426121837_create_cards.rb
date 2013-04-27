class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.references :deck
      t.timestamps
    end
    add_index :cards, [:deck_id]
  end
end
