module Simple
  require "~/tmux_setup/routes.rb"
  include Routes
  
  require Routes::SETUP
  require Routes::BINDINGS 
  require Routes::UTILITIES 
  
  extend Setup
  extend Bindings
  extend Utilities 
  
  def self.start 
    Bindings.conf_file
    Setup.divider
    puts "would you like to create key bindings?" 
    input = gets.chomp
    if input =~ (/\Ay|yes\z/)
     Simple.choices
    end
  end
  
    def self.yes_or_no 
      input = gets.chomp
      unless input =~ /exit/
        input
      end 
   end
    
    def self.choices   
      puts "change PREFIX to  ctrl a? (y|n)"
      if Simple.yes_or_no =~ /y/  
        Utilities.bind_command(Bindings::Keys.prefix)
      end
       
      puts "change delay of commands to interact with vim better? (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.escape_time)  
      end

      puts "set a source ~/tmux.conf shortcut? (y|n)"
      if Simple.yes_or_no =~ /y/   
        Utilities.bind_command(Bindings::Keys.reload_conf)
      end
     
      puts "send PREFIX to other apps like vim with pressing PREFX * 2 (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.send_prefix)
      end
    
      puts "split window into horizontal pane with PREFIX + | (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.horizontal_pane)
      end
         
      puts "split window into vertical pane with PREFIX + - (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.vertical_pane)
        Bindings::Keys.vertical_pane_note
      end

      puts "remap movement keys to emulate vim 'h, j, k, l' (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.vim_keys)
      end

      puts "resize panes with PREFIX + 'vim movement keys' PREFIX + H ? (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.resize_panes)
        Bindings::Keys.resize_panes_note
      end

      puts "enable mouse mode for selecting panes, windows, and scrolling? (y|n)"
      if Simple.yes_or_no =~ /y/
        Utilities.bind_command(Bindings::Keys.mouse_mode)
        Bindings::Keys.mouse_mode_note
      end
     Setup.divider
   end  


end
