def stairway_game
  stair = 0
  turn = 0

  while stair < 10
    turn += 1
    n = rand(1..6)
    if n >= 5
      stair += 1
    elsif n > 1 && n < 5
      stair = stair == 0 ? 0 : stair + 1
    end
    puts "Vous êtes sur la marche n° #{stair}"
  end

  puts "Bravo ! Vous avez réussi en #{turn} tours !"

  return turn
end

def average_finish_time
  total_turns = 0
  for i in 1..100
    total_turns += stairway_game
  end

  total_turns / 100
end

puts "Il faut en moyenne #{average_finish_time} tours pour gagner."