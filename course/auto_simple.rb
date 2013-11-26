require "~/tmux_setup/library/bindings"
require "~/tmux_setup/tools/utilities"

module AutoSimple
  
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
