module Start
  require "~/tmux_setup/routes.rb"
  extend Routes
  
  require Routes::UTILITIES
  extend Utilities

  class BuildAlias
    include Term::ANSIColor
    include Utilities
    # Makes an alias to the command "forgot_tmux" in your 
    # ~/.bash_rc file.
    # Then you can type "frogot_tmux in your terminal to start the script"

    def initialize
      Dir.chdir()
      @home = Dir.pwd
      @bash = "#{@home}/.bashrc"
    end

    def find_bash
      puts %{Searching for ~/.bashrc file"}
      Utilities.progress_bar
      if File.exists?("#{@bash}") == true
        puts green, %{Found a ~/.bashrc file.}, clear 
        add_alias
        add_source  
      elsif
        puts %{No ~/.bashrc file detected}
        create_bashrc
        add_source
      end
    end
    
    private   
    def add_source
      puts %{Adding source ~/.bash_rc to ~/.bash_profile}
            add_source = "source ~/.bashrc"
            Utilities.progress_bar
            Utilities.anti_replication("#{@home}/.bash_profile", add_source, 
                                       /source ~\/.bashrc/)

    end
    
    def add_alias
      puts %{Adding alias command "forgot_tmux"}
      forgot_tmux_alias = "alias forgot_tmux='ruby ~/tmux_setup/tmux_setup.rb'"
      Utilities.progress_bar      
      Utilities.anti_replication("#{@bash}", forgot_tmux_alias, /forgot_tmux/) 
      puts %{=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}
    end
    
    def create_bashrc
      puts green, "Creating ~/.bashrc", clear  
        bash_file = File.open("#{@bash}", "a")
        bash_file.puts "#alias forgot_tmux..use at command line"
        bash_file.puts "alias forgot_tmux='ruby ~/tmux_setup/tmux_setup.rb'"
        Utilities.log_write("#created ~/.bashrc filei", "#{@bash}")
        Utilities.log_write("#added forgot_tmux alias", "#{@bash}")
    end
  
  end
end

