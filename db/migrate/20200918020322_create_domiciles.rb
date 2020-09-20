class CreateDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :domiciles do |t|
      t.integer :postal_code,   null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :addresses,      null: false
      t.string :building_name
      t.integer :phone_number, limit: 5, null: false
      t.references :order
      t.timestamps
    end
  end
end
