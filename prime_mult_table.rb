require './prime_helper'

class PrimeMultTable
  def initialize(length = 0)
    # generate array of length prime numbers
    # nested loop to generate the table

    @header = [nil]
    @rows = []

    arr_of_primes = PrimeHelper.array_of_primes(length)

    arr_of_primes.each do |n|
      @header << n

      current_row = [n]
      arr_of_primes.each do |m|
        current_row << n * m
      end
      @rows << current_row
    end
  end

  def header
    @header
  end

  def rows
    @rows
  end

  def print
    puts @header.join('  ')
    @rows.each { |row| puts row.join('  ') }
  end
end


def prime_mult_table_test(object, method, expected_return_value)
  actual_return_value = object.send(method.to_sym)
  if actual_return_value == expected_return_value
    puts "pass"
    return
  end

  p "FAIL: #{method} returns #{actual_return_value} but should return #{expected_return_value}"
end

def run_prime_mult_table_tests
  table_length_2 = PrimeMultTable.new(2)

  prime_mult_table_test(table_length_2, :header, [nil, 2, 3])
  prime_mult_table_test(table_length_2, :rows, [[2, 4, 6], [3, 6, 9]])

  expected_tens_primes_rows = [
    [	2	,	4	,	6	,	10	,	14	,	22	,	26	,	34	,	38	,	46	,	58	]	,
    [	3	,	6	,	9	,	15	,	21	,	33	,	39	,	51	,	57	,	69	,	87	]	,
    [	5	,	10	,	15	,	25	,	35	,	55	,	65	,	85	,	95	,	115	,	145	]	,
    [	7	,	14	,	21	,	35	,	49	,	77	,	91	,	119	,	133	,	161	,	203	]	,
    [	11	,	22	,	33	,	55	,	77	,	121	,	143	,	187	,	209	,	253	,	319	]	,
    [	13	,	26	,	39	,	65	,	91	,	143	,	169	,	221	,	247	,	299	,	377	]	,
    [	17	,	34	,	51	,	85	,	119	,	187	,	221	,	289	,	323	,	391	,	493	]	,
    [	19	,	38	,	57	,	95	,	133	,	209	,	247	,	323	,	361	,	437	,	551	]	,
    [	23	,	46	,	69	,	115	,	161	,	253	,	299	,	391	,	437	,	529	,	667	]	,
    [	29	,	58	,	87	,	145	,	203	,	319	,	377	,	493	,	551	,	667	,	841	]
  ]

  table_length_10 = PrimeMultTable.new(10)

  prime_mult_table_test(table_length_10, :header, [	nil	,	2	,	3	,	5	,	7	,	11	,	13	,	17	,	19	,	23	,	29	]	)
  prime_mult_table_test(table_length_10, :rows, expected_tens_primes_rows)
end
