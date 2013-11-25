module Bindings
  require "~/tmux_setup/routes.rb"
  extend Routes
  
  require Routes::UTILITIES
  include Utilities
  extend Term::ANSIColor    
  
    @file = "~/tmux_tester.conf"
    Dir.chdir()
    @home = Dir.pwd 
    
    def self.conf_file
      if File.exist?('.tmux.conf')
        puts red, "Found ~/.tmux.conf file", clear
      else
        %x{touch #{@file}}  
        puts red, "Created ~/tmux.conf file", clear
      end     
    end
  
  class Keys
    def self.prefix
      ["#unbind ctrl b",
       "unbind C-b",
       "#change prefix to ctrl a",
       "set -g prefix C-a"] 
    end
    
    def self.escape_time
      ["# change command escape time to interact with vim better",
       "set -sg escape-time"]
    end
    
    def self.reload_conf
      ["# add a hot key for sourcing the .tmux.conf file", 
       "-r bind r source-file ~/.tmux.conf  \\; display 'Reloaded!'"] 
    end

    def self.send_prefix
      ["# allows PREFIX to be sent with typing PREFIX twice",
       "bind C-a send-prefix"]
    end

    def self.horizontal_pane
      ["# split window into horiontal pane with PREFIX |", 
       "bind | split-window -h"]
    end

    def self.vertical_pane
      ["# split window into vertical pane with PREFIX - ", 
       "bind - split-window -v"]
    end
    
    def self.vertical_pane_note
     puts %{* Note that in tmux horizontal means stacking panes horizontally
              across the window. Vertial panes are stacked vertically on top of 
              one another other. 
                                  _____________________
                        Veritcal: _____________________
                                  _____________________
     
                                  | | |
                      Horizontal: | | |
                                  | | |
                                  | | |  
           }
   end  

    def self.vim_keys
      ["# emulate vim's movement keys h,j,k,l", 
       "bind h select-pane -L",  
       "bind j select-pane -D",  
       "bind k select-pane -U",  
       "bind l select-pane -R"]
    end

    def self.resize_panes
      ["# resize panes with vim like movement keys PREFIX H = Left",  
       "bind -r H resize-pane -L 5",
       "bind -r J resize-pane -D 6",  
       "bind -r K resize-pane -U 5",  
       "bind -r L resize=pane -R 5"]  
    end
    
    def self.resize_panes_note
      puts %{* Note we are using upper case letters in the config file. Tmux
               allows us to use both U.case and L.case letters for bindings.
               and for this binding we are using the -r arg. That tells
               tmux to repeat the command, so we don't have to type
               the PREFIX once per pane adjustment.} 
    end
    
    def self.mouse_mode
      ["# allow for mouse actions like pane selection",  
       "setw -g mode-mouse on",  
       "setw -g mouse-select-pane on",  
       "setw -g mouse-resize-pane on", 
       "setw -g mouse-select-window on"]
    end
    
    def self.mouse_mode_note
      puts %{* Note we just used "setw" and "-g". Those stand for set-window and
               global. "set-window" is used for actions relevent to windows
               and "-g" applies the arg. globaly.}
      
      puts %{* Note this key-binding is nice when your getting used to tmux,
               but later we reccomend you turn it off and rely on the keyboard.
               You turn mouse functions off by changing the "on" at the end 
               of a binding to "off"}
    
    end
  end
end
