class RepairType < ActiveRecord::Base
  has_many :car_repair_jobs
end
