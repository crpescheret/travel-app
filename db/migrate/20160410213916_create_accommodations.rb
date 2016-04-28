class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.integer :trip_id
      t.string :name
      t.string :type
      t.string :price
      t.string :status
      t.string :address
      t.string :url
      t.integer :rank

      t.timestamps null: false
    end
  end
end
