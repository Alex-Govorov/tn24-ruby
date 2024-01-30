vowels = %w[a e i o u]
letters = ('a'..'z').to_a
h = {}

vowels.each { |vowel| h[vowel] = letters.find_index(vowel) }
