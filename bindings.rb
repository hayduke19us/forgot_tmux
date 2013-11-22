module Bindings
    
   @file = "~/tmux_tester.conf"
    
    def self.conf_file
      %x{touch #{@file}}
    end
   
    def self.prefix
      %x{echo "#"unbind ctrl b >> #{@file}
         echo unbind C-b >> #{@file}
         echo "#"change prefix to ctrl a >> #{@file} 
         echo set -g prefix C-a >> #{@file}}
    end
    
    def self.escape_time
      %x{echo "#"change command escape time to interact with vim better >> #{@file}
         echo "set -sg escape-time" >> #{@file}}
    end
    
    def self.reload_conf
      %x{echo "#"add a hot key for sourcing the .tmux.conf file >> #{@file} 
         echo "-r bind r source-file ~/.tmux.conf  \\; display 'Reloaded!'" >> #{@file}} 
    end

    def self.send_prefix
      %x{echo "#"allows PREFIX to be sent with typing PREFIX twice >> #{@file}
         echo "bind C-a send-prefix" >> #{@file}}
    end

    def self.horizontal_pane
      %x{echo "#"split window into horiontal pane with PREFIX | >> #{@file}
         echo "bind | split-window -h" >> #{@file}}
    end

    def self.vertical_pane
      %{echo "#" split window into vertical pane with PREFIX - >> #{@file}
        echo "bind - split-window -v" >> #{@file}}
    
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
     Setup.divider
    end

  end
