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
        puts green, "Found ~/.tmux.conf file", clear
      else
        puts red, "No #{@file} found.", clear
        %x{touch #{@file}}  
        puts green, "Created ~/tmux.conf file", clear
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
    
    def self.mouse_mode
      ["# allow for mouse actions like pane selection",  
       "setw -g mode-mouse on",  
       "setw -g mouse-select-pane on",  
       "setw -g mouse-resize-pane on", 
       "setw -g mouse-select-window on"]
    end
    
  end
end
