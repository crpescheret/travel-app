class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :trip_id
      t.string :airline
      t.boolean :departing
      t.boolean :arriving
      t.string :flight_number
      t.date :date
      t.string :depart_time
      t.string :arrive_time
      t.string :status

      t.timestamps null: false
    end
  end
end
