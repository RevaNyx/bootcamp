class CreateDonations < ActiveRecord::Migration[7.2]
  def change
    create_table :donations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :amount
      t.boolean :recurring, default: false
      t.string :stripe_charge_id
      t.string :stripe_subscription_id

      t.timestamps
    end
  end
end
