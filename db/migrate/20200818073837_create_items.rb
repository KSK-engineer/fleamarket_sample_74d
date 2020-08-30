class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                  null: false
      t.text :detail,                  null: false
      t.integer :prefecture_id,        null: false
      t.integer :condition,            null:false, default: 0
      t.integer :delivery_fee,          null: false, default: 0
      t.integer :delivery_day,          null:false, default: 0
      t.integer :price,                null:false
      t.integer :seller_id,            null: false, foreign_key: true
      t.integer :buyer_id,             null: false, foreign_key: true
      t.integer :brand_id,             null: false, foreign_key: true
      t.integer :category_id,          null: false,  default: 0
      t.timestamps
    end
  end
end
