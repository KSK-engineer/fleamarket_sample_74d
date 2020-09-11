class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :family_name,      null: false
      t.string     :given_name,       null: false
      t.string     :family_name_kana, null: false
      t.string     :given_name_kana,  null: false
      t.integer    :postcode,         null: false
      t.integer    :prefecture,       null: false
      t.string     :city,             null: false
      t.string     :block,            null: false
      t.string     :building
      t.string     :room_number
      t.string     :phone_number
      t.timestamps
    end
  end
end
