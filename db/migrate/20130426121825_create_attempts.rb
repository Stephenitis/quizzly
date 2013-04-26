class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :game, :card
      t.boolean :status
  end
end
