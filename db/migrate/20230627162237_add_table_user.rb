class AddTableUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :category, null:false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.datetime :deleted_at, null: true
    end

    add_index :users, :email
    add_index :users, :category
    add_index :users, :created_at
  end
end
