module AutoSimple
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
    Utilities.divider
    puts "would you like to create key bindings?" 
    input = gets.chomp
    if input =~ (/\Ay|yes\z/)
    Utilities.divider  
      choices
    end
  end  
 
  def self.choices
   Bindings::Keys.singleton_methods.each do |method|
   Utilities.progress_bar 
   puts "binding #{method}" 
   Utilities.bind_command(Bindings::Keys.send method.to_sym)
   end
  end
end
