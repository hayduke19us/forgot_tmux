module TmuxSetup
  #all routes are in constants in routes.rb
  require "~/tmux_setup/routes.rb"
  include Routes
 
  require Routes::QUESTION_PARSER 
  extend Question_Parser 
 
  #first we get the user input 
  def self.query
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "What do you need help with?"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-==-"
    question = gets.chomp 
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    unless question =~ /(exit|quit|nothing)/
      self.type_of_query(question)
    end
  end
  
  #then we put user input into an array and compare input to reg exp with
  #reg_helper method. 
  def self.type_of_query(phrase)
    phrase_array = phrase.split
    phrase_array.each do |word|
      Question_Parser.reg_helper(word)    
    end
    self.query
  end
end

TmuxSetup.query
