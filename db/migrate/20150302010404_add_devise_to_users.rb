class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      ## Database authenticatable
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
      t.integer :spouse_id
      t.boolean :admin
      t.boolean :district_supervisor
      t.boolean :area_supervisor
      t.boolean :supervisor
      t.boolean :leader
      t.boolean :assist
      t.boolean :assist_in_training
      t.boolean :member
      t.boolean :member_away
      t.boolean :visitor
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end