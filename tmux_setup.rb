class TmuxSetup
  require "~/tmux_setup/routes.rb"
  include Routes
 
  require QUESTION_PARSER 
  extend Question_Parser 
  
  def query
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "What do you need help with?"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-==-"
    question = gets.chomp 
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    unless question =~ /(exit|quit)/
      type_of_query(question)
    end
  end
  
  def type_of_query(question)
    question = question.split
    question.each do |word|
      Question_Parser.reg_helper(word)    
      more_help? 
    end
  end
  
  
    private
    
    def more_help?
      puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
      puts "is there any thing else i can help you with?" 
      answer = gets.chomp
      puts "=-=-=-=-=-=-=-"
      if answer =~ (/\An|\Aquit|\Aexit/)
        puts "thanks come again"
      else
        query
      end
    end 
end

mux = TmuxSetup.new
mux.query
