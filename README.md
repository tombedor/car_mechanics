Car Mechanic Metrics
==============

**Setup**

Initialize database with:

rake db:migrate

rake db:setup

**Usage**

Output is printed to command line using rake tasks. For the mechanic benchmarks by job type, run:

rake metrics:mechanic_benchmark_by_job_type


Results are sorted by job, then by performance. 

For mechanic overall metrics, run:

rake metrics:mechanic_overall_benchmark

**Tests**

To run tests, run:

rspec

**Notes**

Implementation departs from the prompt in a few ways:

- "id" columns are all unique, so the last entry of the car_repairs seed table is
5 rather than 4.
- Database is SQLite, rather MySQL, to simplify implementation.
- I assigned a numerical ID for repair_type_id, rather than using the letter ID directly.
This makes handling with Rails much cleaner.
- In the example, it seems the ratio was divided by the average length of job, meaning a higher number was good. I 
thought the other way around was more logical. So, I present (average time) / benchmark, meaning a lower average ratio
is better.

