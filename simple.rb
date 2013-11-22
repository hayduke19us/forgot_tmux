module Simple
  require Setup::PATH + "setup.rb"
  require Setup::PATH + "bindings.rb"
  extend Setup
  extend Bindings
 
  def self.start 
    Bindings.conf_file
    Setup.divider
    puts "~/.tmux.conf file created"
    Setup.divider
    puts "would you like to create key bindings?" 
    input = gets.chomp
    if input =~ (/\Ay|yes\z/)
     key =  Simple::Key.new
     key.choices
    end
  end
  
  class Key
    def self.yes_or 
      input = gets.chomp
      input
    end
    
    def choices   
      puts "change PREFIX to  ctrl a? (y|n)"
      if Key.yes_or =~ /y/  
        Bindings.prefix
      end
       
      puts "change delay of commands to interact with vim better? (y|n)"
      if Key.yes_or =~ /y/
        Bindings.escape_time  
      end

      puts "set a source ~/tmux.conf shortcut? (y|n)"
      if Key.yes_or =~ /y/   
        Bindings.reload_conf
      end
     
      puts "send PREFIX to other apps like vim with pressing PREFX * 2"
      if Key.yes_or =~ /y/
        Bindings.send_prefix
      end
    
      puts "split window into horizontal pane with PREFIX + |"
      if Key.yes_or =~ /y/
        Bindings.horizontal_pane
      end
         
      puts "split window into vertical pane with PREFIX + -"
      if Key.yes_or =~ /y/
        Bindings.vertical_pane
      end
    Setup.divider
   end  
  end

end
