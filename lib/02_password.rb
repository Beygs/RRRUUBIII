require "io/console"

def signup
  puts "Salut ! Veuillez renseigner un mot de passe."
  print "> "
  passwd = STDIN.noecho(&:gets)

  puts "Veuillez confirmer le mot de passe."
  print "> "
  confirm = STDIN.noecho(&:gets)
  
  begin
    raise StandardError.new if passwd != confirm
    return passwd
  rescue
    puts "\e[31mLes mots de passe ne sont pas identiques !\e[0m"
    signup
  end
end

def login(pwd)
  puts "Veuillez rentrer votre mot de passe."
  print "> "
  pass = STDIN.noecho(&:gets)

  begin
    raise StandardError.new if pass != pwd
    return true
  rescue
    puts "\e[31mMOT DE PASSE INCORRECT\e[0m"
    login(pwd)
  end
end

def welcome_screen
  system "clear"
  puts "\e[35m

  ______   _______  _______  _______  ___   _______  ______     
  |      | |       ||       ||       ||   | |       ||    _ |    
  |  _    ||   _   ||  _____||  _____||   | |    ___||   | ||    
  | | |   ||  | |  || |_____ | |_____ |   | |   |___ |   |_||_   
  | |_|   ||  |_|  ||_____  ||_____  ||   | |    ___||    __  |  
  |       ||       | _____| | _____| ||   | |   |___ |   |  | |  
  |______| |_______||_______||_______||___| |_______||___|  |_|  
   __   __  ___      _______  ______    _______                  
  |  | |  ||   |    |       ||    _ |  |   _   |                 
  |  | |  ||   |    |_     _||   | ||  |  |_|  |                 
  |  |_|  ||   |      |   |  |   |_||_ |       |                 
  |       ||   |___   |   |  |    __  ||       |                 
  |       ||       |  |   |  |   |  | ||   _   |                 
  |_______||_______|  |___|  |___|  |_||__| |__|                 
   _______  _______  _______  ______    _______  _______         
  |       ||       ||       ||    _ |  |       ||       |        
  |  _____||    ___||       ||   | ||  |    ___||_     _|        
  | |_____ |   |___ |       ||   |_||_ |   |___   |   |          
  |_____  ||    ___||      _||    __  ||    ___|  |   |          
   _____| ||   |___ |     |_ |   |  | ||   |___   |   |          
  |_______||_______||_______||___|  |_||_______|  |___|          
  
          \e[0m
  "
  puts "Vous avez rentré le bon mot de passe."
  puts "Voilà."
  puts "Rien de plus."
  puts "Bonne journée."
end

def perform
  passwd = signup
  welcome_screen if login(passwd)
end

perform