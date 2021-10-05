def ask_number
  puts "Yoyoyo ! On va construire une pyramide, combien d'étages veux-tu ?"
  print "> "
  floors = gets.chomp

  begin
    return floors = Integer(floors)
  rescue 
    puts "\e[31m#{floors} n'est pas un nombre !\e[0m"
    ask_number
  end
end

def ask_odd_number
  number = ask_number
  begin
    raise StandardError.new if number.even?
    return number
  rescue
    puts "\e[31mRentres un nombre impair stp\e[0m"
    ask_odd_number
  end
end

def half_pyramid(char, floors, side)
  system "clear"

  pyramid = []

  for i in 1..floors
    if side == "l"
      pyramid << (char * i).rjust(floors, " ")
    else
      pyramid << char * (i - 1)
    end
  end

  pyramid
end

def full_pyramid(floors)
  pyramid = []

  l = half_pyramid("#", floors, "l")
  r = half_pyramid(")", floors, "r")
  
  floors.times{|i|
    pyramid << l[i] + r[i]
  }

  return pyramid
end

def wtf_pyramid(floors)
  pyramid = []

  pyramid << full_pyramid(floors / 2)
  pyramid << full_pyramid(floors / 2 - 1).map{|line| line = " #{line}"}.reverse

  return pyramid
end

puts wtf_pyramid(ask_odd_number)