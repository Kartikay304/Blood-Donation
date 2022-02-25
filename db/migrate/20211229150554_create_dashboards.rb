class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.string :username
      t.string :blood_group
      t.string :camp
      t.integer :donated
      t.integer :received
      t.integer :approved
      t.integer :*
      t.timestamps
    end
  end
end
