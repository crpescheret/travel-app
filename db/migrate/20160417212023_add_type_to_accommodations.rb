class AddTypeToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :type, :string
  end
end
