module Question_Parser
 require '~/tmux_setup/categories.rb'
 extend Categories 
  def self.reg_helper(word)
    if word =~ /(\Awi|ow\z)/
      Categories.windows 
    elsif word =~ /(\Ass|ion\z|\Aatt|\A..att)/ 
      Categories.sessions
    elsif word =~ /(\Apa|nes\z)/ 
      Categories.panes
    elsif word =~ /(\Acom|mand\z)/ 
      Categories.command_mode
    elsif word =~ (/\Ahel|h/)
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
