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
      Simple.key_binding_walk
    end
  end
  def self.question_helper
    input = gets.chomp
    input
  end
  
  def self.key_binding_walk
    
     puts "change PREFIX to  ctrl a? (y|n)"
     q = Simple.question_helper 
     if  q  =~ /y/
       Bindings.prefix
     end
     
     puts "change delay of commands to interact with vim better? (y|n)"
     q
     if q =~ /y/
     Bindings.escape_time  
     end
     puts "set a source ~/tmux.conf shortcut? (y|n)"
     Bindings.reload_conf
     
     puts "send PREFIX to other apps like vim with pressing PREFX * 2"
     Bindings.send_prefix

     puts "split window into horizontal pane with PREFIX + |"
     Bindings.horizontal_pane

     puts "split window into vertical pane with PREFIX + -"
     Bindings.vertical_pane

      
   Setup.divider
      
  end

end
