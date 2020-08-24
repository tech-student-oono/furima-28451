class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :name,             null: false
      t.string :image,            null: false
      t.integer :text,            null: false
      t.integer :status,          null: false
      t.integer :price,           null: false
      t.text :comments,           null: false
      t.integer :delivery_fee,    null: false
      t.integer :shipping_origin, null: false
      t.integer :date_and_time,   null: false
      t.integer :category,        null: false
      t.timestamps
    end
  end
end