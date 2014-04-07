class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :nick
      t.string :phone
      t.string :zip
      t.string :addr 
      t.string :addr2
      t.string :city
      t.string :state
      t.references :user

      t.timestamps
    end
  end
end