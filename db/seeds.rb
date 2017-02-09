# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  ['A', 'oil change', 1],
  ['B', 'tire repair', 1],
  ['C', 'engine inspection', 3],
  ['D', 'tune-up', 2],
  ['E', 'brake service', 3],
  ['F', 'oil gasket replacement', 2.5],
].each do |code, name, national_average_length|
  RepairType.create!(
    code: code,
    name: name,
    national_average_length: national_average_length
  )
end


[
  ['2016-12-01', '2016-12-01', 'Bob', 1],
  ['2016-12-02', '2016-12-05', 'Rich', 4],
  ['2016-12-03', '2016-12-07', 'Rich', 4],
  ['2016-12-04', '2016-12-05', 'Rich', 1],
  ['2016-12-04', '2016-12-06', 'Simone', 5],
  ['2016-12-05', '2016-12-08', 'Bob', 6],
  ['2016-12-06', '2016-12-06', 'Bob', 6],
  ['2016-12-07', '2016-12-10', 'Simone', 6],
  ['2016-12-07', '2016-12-15', 'Lazy Joe', 3],
  ['2016-12-07', '2016-12-18', 'Lazy Joe', 4],
  ['2016-12-08', '2016-12-08', 'Fast Gary', 1],
  ['2016-12-08', '2016-12-08', 'Fast Gary', 3],
  ['2016-12-08', '2016-12-08', 'Fast Gary', 4]
].each do |dropoff_date, pickup_date, mechanic, repair_type_id|
  CarRepairJob.create!(
    dropoff_date: dropoff_date,
    pickup_date: pickup_date,
    assigned_mechanic: mechanic,
    repair_type_id: repair_type_id
  )
end


