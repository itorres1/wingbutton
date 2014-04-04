class AddUsersAttributes < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name 
      t.string :password_digest
    end
  end
end