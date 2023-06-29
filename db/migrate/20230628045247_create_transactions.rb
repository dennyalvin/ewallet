class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :source_user, null:false
      t.integer :target_user
      t.string :category, null: false
      t.decimal :amount, null: false, default: 0, :precision=>64, :scale=>12
      t.string :status
      t.timestamps
    end

    add_index :transactions, :source_user
    add_index :transactions, :target_user
    add_index :transactions, :category
    add_index :transactions, :status
  end
end
