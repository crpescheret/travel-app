class RemoveDepartingandArrivingFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :departing, :boolean
    remove_column :flights, :arriving, :boolean
  end
end
