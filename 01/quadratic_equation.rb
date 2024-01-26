puts 'Введите коэффициент a:'
a = gets.chomp.to_f
puts 'Введите коэффициент b:'
b = gets.chomp.to_f
puts 'Введите коэффициент c:'
c = gets.chomp.to_f

d = (b**2) - (4 * a * c)

if d.positive?
  d_sqrt = Math.sqrt(d)
  x1 = (d_sqrt - b) / 2 * a
  x2 = (-d_sqrt - b) / 2 * a
  puts "Дескриминант: #{d}, корни: #{x1} и #{x2}"
elsif d.zero?
  x = -b / 2 * a
  puts "Дескриминант: #{d}, корень: #{x}"
else
  puts 'Корней нет'
end
