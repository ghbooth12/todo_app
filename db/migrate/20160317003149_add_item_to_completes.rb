class AddItemToCompletes < ActiveRecord::Migration
  def change
    add_column :completes, :item_id, :integer
    add_index :completes, :item_id
  end
end
