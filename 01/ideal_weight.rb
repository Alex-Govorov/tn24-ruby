puts 'Ваше имя?'
name = gets.chomp

puts 'Ваш рост?'
height = gets.chomp.to_i

ideal_weight = (height - 110) * 1.15

if ideal_weight.positive?
  puts "#{name}, ваш идеальный вес: #{ideal_weight}"
else
  puts 'Ваш вес уже оптимальный'
end
