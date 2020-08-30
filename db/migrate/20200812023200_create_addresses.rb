class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,       null: false, foreign_key: true
      t.integer    :postcode,   null: false
      t.integer    :prefecture, null: false
      t.string     :city,       null: false
      t.string     :block,      null: false
      t.string     :building
      t.string     :room_number
      t.string     :phone_number
      t.timestamps
    end
  end
end
