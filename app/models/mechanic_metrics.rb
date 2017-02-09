class MechanicMetrics

  def self.benchmark_by_job_type_records
    RepairType.
      joins(:car_repair_jobs).
      select("
        car_repair_jobs.assigned_mechanic,
        repair_types.code,
        avg(1 + julianday(pickup_date) - julianday(dropoff_date)) as average_time,
        avg((1 + julianday(pickup_date) - julianday(dropoff_date)) / repair_types.national_average_length) as ratio").
      group("
        car_repair_jobs.assigned_mechanic,
        repair_types.code").
      order("code", "avg((1 + julianday(pickup_date) - julianday(dropoff_date)) / repair_types.national_average_length)")
  end

  def self.print_benchmark_by_job_type_records
    puts "Name - type - average time - ratio of average"
    benchmark_by_job_type_records.each do |record|
      puts [record.assigned_mechanic, record.code, record.average_time, record.ratio].join(' - ')
    end
  end

  def self.overall_benchmark_records
    RepairType.
      joins(:car_repair_jobs).
      select("
        car_repair_jobs.assigned_mechanic,
        avg((1 + julianday(pickup_date) - julianday(dropoff_date)) / repair_types.national_average_length) as ratio").
      group("
        car_repair_jobs.assigned_mechanic").
      order("avg((1 + julianday(pickup_date) - julianday(dropoff_date)) / repair_types.national_average_length)")
  end

  def self.print_overall_benchmark_records
    puts "Name - ratio of average"
    overall_benchmark_records.each do |record|
      puts [record.assigned_mechanic, record.ratio].join(' - ')
    end

  end
end
