require "~/tmux_setup/library/categories"
module Question_Parser
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
    elsif word =~ (/\Aset|up\z/)
      Categories.setup
    elsif word =~ (/\A.el|lp\z/)
      Categories.help
    end
  end
  
end
