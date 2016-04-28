class RenameTypeFromAccommodations < ActiveRecord::Migration
  def change
    rename_column :accommodations, :type, :property_type
  end
end
