module Notes
  require '~/tmux_setup/routes.rb'
  extend Routes
  extend Utilities  
  
  def self.vertical_pane_note
    Utilities.divider
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
  Utilities.divider
  def self.resize_panes_note
    Utilities.divider
    puts %{* Note we are using upper case letters in the config file. Tmux
             allows us to use both U.case and L.case letters for bindings.
             and for this binding we are using the -r arg. That tells
             tmux to repeat the command, so we don't have to type
             the PREFIX once per pane adjustment.} 
  end
    Utilities.divider
  def self.mouse_mode_note
    Utilities.divider
    puts %{* Note we just used "setw" and "-g". Those stand for set-window and
             global. "set-window" is used for actions relevent to windows
             and "-g" applies the arg. globaly.}
      
    puts %{* Note this key-binding is nice when your getting used to tmux,
             but later we reccomend you turn it off and rely on the keyboard.
             You turn mouse functions off by changing the "on" at the end 
             of a binding to "off"}
    Utilities.divider 
  end
end
