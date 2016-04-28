class RemoveTypeFromAccommodations < ActiveRecord::Migration
  def change
    remove_column :accommodations, :type, :string
  end
end
