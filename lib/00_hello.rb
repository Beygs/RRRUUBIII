def say_hello(first_name)
  "Bonjour, #{first_name} !"
end

def ask_first_name
  puts "Salut, c'est quoi ton petit nom ?"
  print "> "
  return gets.chomp.capitalize
end

puts say_hello(ask_first_name)