class AddAncestryToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tables, :ancestry, :string
    add_index :tables, :ancestry
  end
end
