class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :familyname_kanji, :string, null: false
    add_column :users, :firstname_kanji,  :string, null: false
    add_column :users, :familyname_kana, :string, null: false
    add_column :users, :firstname_kana,   :string, null: false
    add_column :users, :birthday,         :date,   null: false
  end
end
