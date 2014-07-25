class CreateDgLeagues < ActiveRecord::Migration
  def change
    create_table :dg_leagues do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.text :description
      t.integer :par

      t.timestamps
    end
  end
end
