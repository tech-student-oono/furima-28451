class CreateDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :domiciles do |t|
      t.integer :postal_code, null: false,  default: 00000000
      t.integer :prefecture_id, null: false
      t.string :city, null: false, default: ""
      t.string :addresses, null: false, default: ""
      t.string :building_name
      t.integer :phone_number, null: false, default: 00000000000

      t.timestamps
    end
  end
end
