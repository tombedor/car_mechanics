require 'rails_helper'
describe MechanicMetrics do
  RepairType.destroy_all
  CarRepairJob.destroy_all

  repair_type = RepairType.create!(code: 'A', name: 'Test', national_average_length: 1)
  CarRepairJob.create(dropoff_date: Date.today - 1, pickup_date: Date.today, assigned_mechanic: 'George', repair_type_id: repair_type.id)
  CarRepairJob.create(dropoff_date: Date.today - 1, pickup_date: Date.today, assigned_mechanic: 'George', repair_type_id: repair_type.id)

  it "should perform the correct aggregations" do
    records = MechanicMetrics.overall_benchmark_records
    records.length.should eq 1
    records[0].ratio.should eq 2
  end
end
