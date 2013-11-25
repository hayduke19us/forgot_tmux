module Setup
   require "~/tmux_setup/routes.rb"
   extend Routes
   
   require Routes::SIMPLE
   require Routes::AUTO_SIMPLE
   require Routes::COMPLEX
   require Routes::AUTO_COMPLEX
   require Routes::START
 
   extend Simple
   extend AutoSimple
   extend Complex_Walk
   extend AutoComplex
   extend Start    
   
   def self.initial_setup
     puts %{We reccomend you remap your CAPS LOCK key to CTRL. In OS X this 
     option is within your System Preferences/Keyboard options.
     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
     Linux takes a little more work but you can find out how to remap 
     keys at http://www.emacswiki.org/emacs/MovingTheCtrlKey}
     puts
     puts %{We offer four kinds of setups:
     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
     1. Simple = .tmux.conf in HOME dir. inludes walk thru.
     2. AutoSimple = .tmux.conf in HOME dir. No walk thru.
     3. Complex = dotfiles dir setup with git repo and .tmux.conf. Walk thru.
     4. AutoComplex = " ". No walk thru.
     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=
     Choose a setup. (1|2|3|4)}
     setup_choice = gets.chomp.to_i
     unless setup_choice =~ (/\Aex|it\z/)
       start = Start::BuildAlias.new
       start.find_bash 
       setup_choice = setup_choice.to_i  
       if setup_choice == 1
         Simple.start
       elsif setup_choice == 2
         AutoSimple.start
       elsif setup_choice == 3
         Complex_Walk.start
       elsif setup_choice == 4
         AutoComplex.start
       else
         puts "please make a selection of 1-4 or type 'exit' to quit."    
       end
     end
   end
   
    
    def self.divider
      puts '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-='
    end
end
