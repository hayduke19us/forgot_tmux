require 'term/ansicolor' 

module Start
  extend Term::ANSIColor

   def self.find_bash
      Dir.chdir()
      puts %{Searching for ~/.bashrc file"}
      Utilities.progress_bar
      if File.exists?(".bashrc") == true
        puts green, %{Found a ~/.bashrc file.}, clear 
       Start.add_alias
       Start.add_source  
      elsif
        puts red, %{No ~/.bashrc file detected}, clear
        Start.create_bashrc
        Start.add_source
      end
    end
    
    def self.add_source
      add_source = "source ~/.bashrc"
      Utilities.progress_bar
      Utilities.anti_replication(".bash_profile", add_source, 
                                       /source ~\/.bashrc/)
    end
    
    def self.add_alias
      forgot_tmux_alias = "alias forgot_tmux='ruby ~/forgot_tmux/lib/tmux_setup.rb'"
      Utilities.progress_bar      
      Utilities.anti_replication(".bashrc", forgot_tmux_alias, /forgot_tmux/) 
      puts %{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}
    end
    
    def self.create_bashrc
      Dir.chdir()
      puts green, "Creating ~/.bashrc", clear  
        bash_file = File.open(".bashrc", "a")
        bash_file.puts "#alias forgot_tmux..use at command line"
        bash_file.puts "alias forgot_tmux='ruby ~/forgot_tmux/tmux_setup.rb'"
        Utilities.log_write("#created ~/.bashrc file", "~/.bashrc")
        Utilities.log_write("#added forgot_tmux alias", "~/.bashrc")
    end
end

