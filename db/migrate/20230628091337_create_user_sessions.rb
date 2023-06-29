class CreateUserSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_sessions do |t|
      t.integer :user_id, null:false
      t.string :token
      t.datetime :expired_at
      t.timestamps
    end

    add_index :user_sessions, :user_id
  end
end
