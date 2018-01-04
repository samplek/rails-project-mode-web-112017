class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.datetime :birth_date
      t.boolean :admin, :default => false
      t.boolean :moderator, :default => false

      t.timestamps
    end
  end
end
