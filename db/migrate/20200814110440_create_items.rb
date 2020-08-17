class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :detail,                 null: false
      t.integer :prefecture_id 
      t.integer :condition,            null: false,  default: 0
      t.string :delivery_fee,         null: false
      t.string :delivery_area,        null: false
      t.string :delivery_days,        null: false
      t.integer :price,               null: false
      t.integer :seller_id,           null: false, foreign_key: true
      t.integer :buyer_id,            null: false, foreign_key: true
      t.integer :brand_id,            null: false, foreign_key: true
      t.integer :category_id,         null: false, default: 0
      t.timestamps
    end
  end
end
