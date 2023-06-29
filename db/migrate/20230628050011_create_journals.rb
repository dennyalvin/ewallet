class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.integer :user_id, null:false
      t.integer :transaction_id
      t.string :notes, null:false
      t.decimal :debit, null: false, default: 0, :precision=>64, :scale=>12
      t.decimal :credit, null: false, default: 0, :precision=>64, :scale=>12
      t.timestamps
    end

    add_index :journals, :user_id
    add_index :journals, :transaction_id
    add_index :journals, :created_at
  end
end
