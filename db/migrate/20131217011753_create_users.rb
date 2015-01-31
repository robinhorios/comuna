class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :street
      t.string :number
      t.string :complement
      t.string :zipcode
      t.string :district
      t.string :city
      t.integer :state_id
      t.string :phone
      t.string :gender
      t.string :email
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
