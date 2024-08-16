class AddIndexToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :user_id, :string
    add_index :blogs, :user_id
    add_column :blogs, :organization_id, :string
    add_index :blogs, :organization_id
  end
end
