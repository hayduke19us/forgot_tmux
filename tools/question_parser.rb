module Question_Parser
  require "~/tmux_setup/routes.rb"
  extend Routes

  require Routes::SETUP
  require Routes::BINDINGS
  require Routes::CATEGORIES

  extend Categories 
  extend Bindings 
 def self.reg_helper(word)
    if word =~ /(\Aw|ind..\z)/
      Categories.windows 
    elsif word =~ /(\Asess|ion\z|\Aatt|ach\z)/ 
      Categories.sessions
    elsif word =~ /(\Apa|nes\z)/ 
      Categories.panes
    elsif word =~ /(\Acom|mand\z)/ 
      Categories.command_mode
    elsif word =~ (/\Aset|up\z/)
      Categories.setup
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
    Categories.singleton_methods.each {|h| p h}
    p "=-=-=-=-=-=-=-=-=-=-=-="
    p "Bindings under 'setup':"
    Bindings::Keys.singleton_methods.each {|h| p h }
  end
end
