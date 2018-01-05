class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :image, default: "default"
      t.string :color, default: "blue"
      t.datetime :birth_date

      t.timestamps
    end
  end
end
