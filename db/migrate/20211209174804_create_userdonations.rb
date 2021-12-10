class CreateUserdonations < ActiveRecord::Migration[6.1]
  def change
    create_table :userdonations do |t|
      t.string :username
      t.string :blood_group
      t.string :camp
      t.integer :donated
      t.timestamps
    end
  end
end
