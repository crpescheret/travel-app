class ChangePriceDataTypeofFlights < ActiveRecord::Migration
  def change
    change_column :flights, :price, :string
  end
end
