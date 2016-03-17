class AddUserToCompletes < ActiveRecord::Migration
  def change
    add_column :completes, :user_id, :integer
    add_index :completes, :user_id
  end
end
