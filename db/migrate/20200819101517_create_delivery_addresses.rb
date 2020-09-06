class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :postal_code,   null: false
      t.integer :prefecture,   null: false
      t.string :city,          null: false
      t.string :house_number,  null: false
      t.string :building_name
      t.string :tle_number,    null: false
      t.timestamps
    end
  end
end