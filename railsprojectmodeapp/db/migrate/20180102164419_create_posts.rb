class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :type
      t.string :title
      t.string :link
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
