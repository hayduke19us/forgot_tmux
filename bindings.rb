module Bindings
    
   @file = "~/tmux_tester.conf"
    
    def self.conf_file
      %x{touch #{@file}}
    end
   
    def self.prefix
      %x{echo "#" unbind ctrl b >> #{@file}
         echo unbind C-b >> #{@file}
         echo "#"change prefix to ctrl a >> #{@file} 
         echo set -g prefix C-a >> #{@file}}
    end
    
    def self.escape_time
      %x{echo "#" change command escape time to interact with vim better >> #{@file}
         echo "set -sg escape-time" >> #{@file}}
    end
    
    def self.reload_conf
      %x{echo "#" add a hot key for sourcing the .tmux.conf file >> #{@file} 
         echo "-r bind r source-file ~/.tmux.conf  \\; display 'Reloaded!'" >> #{@file}} 
    end

    def self.send_prefix
      %x{echo "#" allows PREFIX to be sent with typing PREFIX twice >> #{@file}
         echo "bind C-a send-prefix" >> #{@file}}
    end

    def self.horizontal_pane
      %x{echo "#" split window into horiontal pane with PREFIX | >> #{@file}
         echo "bind | split-window -h" >> #{@file}}
    end

    def self.vertical_pane
      %x{echo "#" split window into vertical pane with PREFIX - >> #{@file}
         echo "bind - split-window -v" >> #{@file}}
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
    %x{echo "#" emulate vim's movement keys h,j,k,l >> #{@file}
       echo "bind h select-pane -L" >> #{@file}
       echo "bind j select-pane -D" >> #{@file}
       echo "bind k select-pane -U" >> #{@file}
       echo "bind l select-pane -R" >> #{@file}}
  end

  def self.resize_panes
   %x{echo "#" resize panes with vim like movement keys PREFIX H = Left >> #{@file}
      echo "bind -r H resize-pane -L 5" >> #{@file}
      echo "bind -r J resize-pane -D 6" >> #{@file}
      echo "bind -r K resize-pane -U 5" >> #{@file}
      echo "bind -r L resize=pane -R 5" >> #{@file}}  
  end
  
  def resize_panes_note
    puts %{* Note we are using upper case letters in the config file. Tmux
             allows us to use bothe U.case and L.case letters for bindings.
             and for this binding we are using the -r arg. That tells
             tmux to repeat the command, so we don't have to type
             the PREFIX once per pane adjustment.} 
  end
  
  def mouse_mode
    %x{echo "#" allow for mouse actions like pane selection >> #{@file}
       echo "setw -g mode-mouse on" >> #{@file}
       echo "setw -g mouse-select-pane on" >> #{@file}
       echo "setw -g mouse-resize-pane on" >> #{@file}
       echo "setw -g mouse-select-window on" >> #{@file}}
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
