class AddRankToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :rank, :integer
  end
end
