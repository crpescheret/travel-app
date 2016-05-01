class AddPriceToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :price, :decimal, precision: 7, scale: 2
  end
end
