class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :blood_group
      t.integer :age
      t.string :email
      t.timestamps
    end
  end
end