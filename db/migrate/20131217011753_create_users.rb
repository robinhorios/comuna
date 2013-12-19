class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :gcem_id
      t.string :name
      t.datetime :date_of_birth
      t.string :address
      t.integer :phone
      t.string :operator
      t.string :email

      t.timestamps
    end
  end
end
