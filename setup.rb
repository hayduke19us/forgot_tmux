module Setup
   require '~/tmux_setup/bindings.rb'
   extend Bindings
   
   def self.initial_setup
     puts Setup.divider
     puts %{Have you created a ".tmux.conf " file in your home directory? (y|n)}
     puts Setup.divider       
            input = gets.chomp
            unless input =~ /n/
     
     puts %{First things first lets change that "PREFIX key"
            from "ctrl b" to "ctrl a". And if it's ok with you I'd 
            like you to  remap your caps lock key to ctrl. Because 
            who uses their CAPS LOCK KEY ANYWAY? 
            =-=-=-=-=-=-=-=-=-=-=-=-=-==
            Are you using OS X or Linux?
            =-=-=-=-=-=-=-=-=-=-=-=-=-==}  
     input = gets.chomp 
     puts '=-=-=-='
     unless input =~ (/\ALin|ux\z|l/)
       
     puts %{Ok no sweat, in system prefrences go to Keyboard
            and click on modifier in the bottom right. From
            there just change CAPS LOCK to = CTRL and
            your set! 
            =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
            is it ok if we start remapping? (yes|no)
            =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-}
       input = gets.chomp
       if input =~ /\Ay|es\z/
         system('open /Applications/System\ Preferences.app')
       else
         puts "Ok lets move on then. Enjoy 'ctrl b' as a PREFIX."
       end
     else
       %{Linux takes a little more work but you can 
         find out how to remap keys at 
         http://www.emacswiki.org/emacs/MovingTheCtrlKey}
     end 
     puts "Welcome back. Time to build that tmux.conf file."
     puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-="
     puts %{Ok, I'm gonna run thru a list of key-bindings and what they
            do If you'd like me to add them to your .tmux.conf file just
            type "y" and press enter. If you'd arn't interested in one
            just type "n" and press enter.}
   end
    
    def self.key_bindings
      puts "change PREFIX to  ctrl a? (y|n)"
      Setup.yes_or_no?(Bindings.prefix)
      puts "change delay of commands to interact with vim better? (y|n)"
      Setup.yes_or_no?(Bindings.escape_time)  
      puts "set a source ~//tmux.conf shortcut? (y|n)"
      Setup.yes_or_no(Bindings.reload_conf)

    end
    
    def self.yes_or_no?(binding)
      Setup.divider
      input = gets.chomp
      puts '=-=-='
      if input =~ /y/
        binding 
      else
      end
    end
    
    def self.divider
      puts '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-='
    end
end
Setup.key_bindings
