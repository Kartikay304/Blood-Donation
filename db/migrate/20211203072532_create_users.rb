class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :blood_group
      t.string :gender
      t.string :street
      t.string :additional_info
      t.string :pin_code
      t.string :city
      t.string :country
      t.string :code 
      t.string :phone_no
      t.string :email
      t.integer :admin
      t.timestamps
    end
  end
end
