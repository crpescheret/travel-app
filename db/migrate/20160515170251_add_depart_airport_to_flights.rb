class AddDepartAirportToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :depart_airport, :string
    add_column :flights, :arrive_airport, :string
  end
end
