require '~/tmux_setup/library/bindings'
require '~/tmux_setup/trail_head/setup'
require '~/tmux_setup/tools/utilities'
module Categories 
  
  class Color
    extend Term::ANSIColor
  end
  def self.help
    puts ""
    puts "Forgot Tmux commands:"
    puts ""
    puts "=-=-=-=-=-=-=-=-=-=-=-="
    Categories.singleton_methods.each {|h| p h}
    puts "=-=-=-=-=-=-=-=-=-=-=-="
    puts Color.magenta, "Bindings under 'setup':", Color.clear
    puts "=-=-=-=-=-=-=-=-=-=-=-="
    Bindings::Keys.singleton_methods.each {|h| p h }
  end

  def self.windows
    puts 'while attached to a tmux session:
         =-=-=-=-
         NEW WINDOW:
         =-=-=-=
         PREFIX c = new window
         PREFIX , = rename current window
         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
         LIST WINDOWS:
         =-=-=-=-=-=-
         PREFIX w
         =-=-=-=-
         KILL WINDOW:
         =-=-=-=-=-=
         PREFIX & = kill current window
         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
         CHANGING WINDOWS:
         =-=-=-=-=-=-=-=-=
         if you look at the bottom of your screen you will see each 
         window named and numbered like "0:shell or 1:vim"
         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==
         PREFIX "# of window" = switches to that window
         PREFIX n = next window, like tabbing thru a browser
         PREFIX p = previous window'
          
 end
  def self.panes
    puts 'while attached to a tmux sesssion:
          =-=-==-= 
          NEW PANE:
          =-=-=-=-=
          PREFIX % =  verticall split pane
          PREFIX " = horizontal split pane
          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==
          SWITCH PANE:
          =-=-=-=-=-=
          PREFIX o or "arrows"
          =-=-=-=-=
          KILL PANE:
          ==-=-=-=-=
          whle in the specified pane:
          =-=-=-=-=-=-=-=-=-=-=-=-==-
          PREFIX x = kills pane
          =-=-=-=-=-=-=-=-=-=-=
          RESIZE PANE
          =-=-=-=-=-=
          PREFIX : resize-pane "-(U|R|D|L)" + "1-100" <ENTER> = command mode
          with arguments of either "U" = up R = "right(for vertical panes)"...
          PREFIX <SPACEBAR> = tmux has several layots:
            *even-horizontal = stacks panes horiz.. left to right
            *even-vertical = stacks panes vert. top to bottom
            *main horizontal = one larger pain on top smaller panes on bottom
            *tiled = arranges all panes evenly'  
            
  end

  def self.sessions
    puts '=-=-=-=-=-=
          NEW SESSION:
          =-=-=-=-=-=-
          tmux new -s "session name" = creates a new session with name
          tmux new -s "" -n "window name" = "" with a named(-n) window
          =-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
          ATTACH TO PRE-XISTING SESSION
          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
          tmux attach = attaches to session if only one exist
          tmux a -t "session name" = attach(a) to target(-t) session
          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
          DE-ATTACH FROM SESSION
          =-=-=-=-=-=-=-=-=-=-=-
          PREFIX d
          =-=-=-==
          KILL A SESSION
          =-=-=-=-=-=-=-
          tmux kill-session -t "session name" = quit a session by target(-t)'
  end
  def self.command_mode
    puts 'commands are rendered in the status bar which is the colored
          bar at the bottom of a tmux screen it will change colors when
          you initiate command mode.
          =-=-=-=-=-=-=-=-=-=-==-=-=
          COMMAND MODE:
          =-=-=-=-=-=-=
          PREFIX : (argument) <ENTER> = command mode with tmux 
                                        argument, enter to initialize
          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
          TMUX COMMAND MODE ARGUMENTS:
          =-=-=-=-=-=-=-=-=-=-=-=-=-=-
         
          new-session -n "name of session"
          new-window ""
          resize-pane -(U|R|L|D) (1-100) 
          *note that the when quiting the bash command the window will also close'
  end
  def self.setup
    Setup.initial_setup 
  end
end
