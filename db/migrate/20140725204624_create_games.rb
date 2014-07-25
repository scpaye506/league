class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :dg_league_id

      t.timestamps
    end
  end
end
