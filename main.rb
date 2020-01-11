require './prime_helper'
require './prime_mult_table'

if ARGV[0] == "test"
  run_helper_tests
  run_prime_mult_table_tests
else
  PrimeMultTable.new(10).print
end
