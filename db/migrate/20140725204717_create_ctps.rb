class CreateCtps < ActiveRecord::Migration
  def change
    create_table :ctps do |t|
      t.integer :hole
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end
  end
end
