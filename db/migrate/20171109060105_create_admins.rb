class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username, null: false
      t.string :encrypted_pass, null: false
      t.string :encrypted_token
      t.string :salt, null: false

      t.timestamps
    end

    add_index :admins, :username
  end
end
