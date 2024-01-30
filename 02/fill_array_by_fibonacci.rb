fib = Hash.new { |fibo, n| fibo[n] = fibo[n - 1] + fibo[n - 2] }.merge!(0 => 0, 1 => 1)

arr = (1..100).to_a.map { |i| fib[i] }
