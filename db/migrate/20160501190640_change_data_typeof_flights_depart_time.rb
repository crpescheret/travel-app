class ChangeDataTypeofFlightsDepartTime < ActiveRecord::Migration
  def change
    remove_column :flights, :depart_time, :string
    remove_column :flights, :arrive_time, :string
    add_column :flights, :depart_time, :datetime
    add_column :flights, :arrive_time, :datetime
  end
end
