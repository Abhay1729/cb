class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.float :cb_redeemable, default: 0
      t.float :cb_redeemed, default: 0
      t.timestamps
    end
  end
end
