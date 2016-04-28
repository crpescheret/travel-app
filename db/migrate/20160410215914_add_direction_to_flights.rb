class AddDirectionToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flight_direction, :string
  end
end
