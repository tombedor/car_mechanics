class AddModels < ActiveRecord::Migration
  def change
    create_table :car_repair_jobs do |t|
      t.date :dropoff_date
      t.date :pickup_date
      t.text :assigned_mechanic
      t.integer :repair_type_id
    end

    create_table :repair_types do |t|
      t.text :code
      t.text :name
      t.float :national_average_length
    end
  end
end
