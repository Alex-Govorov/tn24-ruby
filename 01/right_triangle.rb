triangle = []

puts 'Введите длину 1-й стороны треугольника'
triangle << gets.chomp.to_f

puts 'Введите длину 2-й стороны треугольника'
triangle << gets.chomp.to_f

puts 'Введите длину 3-й стороны треугольника'
triangle << gets.chomp.to_f

triangle.sort!

a = triangle[0]
b = triangle[1]
c = triangle[2]

if c**2 == a**2 + b**2
  puts 'Треугольник прямоугольный'
elsif a == b && b == c
  puts 'Треугольник равнобедренный и равносторонний'
elsif a == b || a == c || b == c
  puts 'Треугольник равнобедренный'
else
  puts 'Треугольник не является прямоугольным, равнобедренным или равносторонним'
end
