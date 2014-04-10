class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :remember_token
      t.string :string
      t.boolean :admin
      t.decimal :discount_rate

      t.timestamps
    end
  end
end
