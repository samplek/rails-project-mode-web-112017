class ChangeNamePosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :type, :post_type
  end
end
