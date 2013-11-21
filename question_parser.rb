module Question_Parser
 require '~/tmux_setup/categories.rb'
 extend Categories 
  def self.reg_helper(word)
    if word =~ /(\Aw|ind..\z)/
      Categories.windows 
    elsif word =~ /(\Asess|ion\z|\Aatt|ach\z)/ 
      Categories.sessions
    elsif word =~ /(\Apa|nes\z)/ 
      Categories.panes
    elsif word =~ /(\Acom|mand\z)/ 
      Categories.command_mode
    elsif word =~ (/\A.el|lp\z/)
      Question_Parser.help
    else
      p "Im sorry but we are having a hard time knowing what you mean"
      p "try 'help' for a list of command libraries"
    end
  end
  
  def self.help
    p "Forgot Tmux Commands:"
    p "=-=-=-=-=-=-=-=-=-=-=-="
    help_library =  %w[windows panes sessions command_mode]
    help_library.each {|h| p h}
  end
end
