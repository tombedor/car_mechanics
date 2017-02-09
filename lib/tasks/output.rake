namespace :metrics do
  task :mechanic_benchmark_by_job_type => [:environment] do
    MechanicMetrics.print_benchmark_by_job_type_records
  end

  task :mechanic_overall_benchmark => [:environment] do
    MechanicMetrics.print_overall_benchmark_records
  end
end
