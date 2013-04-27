class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, :deck
      t.boolean :status, :default => false
    end
  end
end
