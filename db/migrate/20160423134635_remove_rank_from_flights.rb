class RemoveRankFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :rank, :integer
  end
end
