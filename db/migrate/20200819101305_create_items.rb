class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string :item_image,           null: false
      t.string :item_name,            null: false
      t.text :item_info,              null: false
      t.integer :item_category,       null: false
      t.integer :item_sales_status,   null: false
      t.integer :shipping_fee_status, null: false
      t.integer :prefecture,          null: false
      t.integer :scheduled_delivery,  null: false
      t.integer :item_price,          null: false
      t.timestamps
    end
  end
end