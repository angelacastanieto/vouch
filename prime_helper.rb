class PrimeHelper
  def self.array_of_primes(length)
    arr_of_primes = []

    n = 0
    while arr_of_primes.length < length do
      arr_of_primes << n if is_prime?(n)
      n += 1
    end

    arr_of_primes
  end

  def self.is_prime?(n)
    return false if n == 0 || n == 1 # 0 and 1 are not prime
    return true if n == 2 # 2 is only prime even number
    return false if n % 2 == 0 # any other even numbers are not prime

    current_divisor = n - 1

    while current_divisor > 2
      return false if n % current_divisor == 0
      current_divisor -= 1
    end

    true
  end
end


def helper_test(method, param, expected_return_value)
  actual_return_value = PrimeHelper.send(method.to_sym, param)
  if actual_return_value == expected_return_value
    puts "pass"
    return
  end

  p "FAIL: #{method}(#{param}) returns #{actual_return_value} but should return #{expected_return_value}"
end

def run_helper_tests
  helper_test(:is_prime?, 0, false)
  helper_test(:is_prime?, 1, false)
  helper_test(:is_prime?, 2, true)
  helper_test(:is_prime?, 3, true)
  helper_test(:is_prime?, 4, false)

  helper_test(:array_of_primes, 10, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
end
