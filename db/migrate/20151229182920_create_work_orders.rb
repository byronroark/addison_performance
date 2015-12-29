class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :style
      t.string :start_city
      t.string :start_state
      t.string :start_zip
      t.string :end_city
      t.string :end_state
      t.string :end_zip
      t.integer :number_of_vehicles
      t.string :vehicle_image_id
      t.string :preferred_method_of_contact
    end
  end
end
