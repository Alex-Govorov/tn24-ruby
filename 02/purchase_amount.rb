products = {}
total = 0

loop do
  puts 'Наименование товара:'
  product = gets.chomp
  break if product == 'стоп'

  puts 'Цена за единицу:'
  price = gets.chomp.to_f

  puts 'Кол-во купленного товара:'
  qantity = gets.chomp.to_f

  products[product] = { price: price, qantity: qantity }
end

puts products

puts 'Итоговая сумма за товар:'

products.each_key do |product|
  total_product = products[product][:qantity] * products[product][:price]
  total += total_product
  puts "#{product}: #{total_product}"
end

puts "Итоговая сумма всех покупок в корзине: #{total}"
