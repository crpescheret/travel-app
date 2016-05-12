class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :trip_id
      t.string :user_id
      t.text :text

      t.timestamps null: false
    end
  end
end
