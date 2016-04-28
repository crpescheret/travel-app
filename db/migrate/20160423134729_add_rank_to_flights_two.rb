class AddRankToFlightsTwo < ActiveRecord::Migration
  def change
    add_column :flights, :rank, :integer, :default => 0
  end
end
