class CreateCashbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :cashbacks do |t|
      t.references :order
      t.references :user
      t.float :amount
      t.string :status
      t.timestamps
    end
  end
end
