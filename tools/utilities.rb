module Utilities
  require "~/tmux_setup/routes.rb"
  extend Routes 
 
  require 'term/ansicolor'
  extend Term::ANSIColor
  
  def self.anti_replication(file, no_replicate, reg)
    found_line = false
    array = IO.readlines(file)
      array.each do |line|
        if line =~ reg
          found_line = true
        end
      end
      if found_line == false
        bash_file = File.open(file, "a")
        bash_file.puts "# #{no_replicate}"
        bash_file.puts no_replicate
        puts green, "#{no_replicate} added to #{file}", clear
        log_write("##{no_replicate}", "#{file}")
      else
        puts red, "Found #{no_replicate} in #{file}", clear
      end
  end
    
    def self.progress_bar
      12.times do
        print magenta, ".", clear
        sleep 0.1
      end
    end

    def self.log_write(action, file)
      t = Time.now
      Dir.chdir()
      @home = Dir.pwd
      log = File.new("#{@home}/tmux_setup/log.txt", 'a')
      log.puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
      log.puts t.strftime("Printed on %m/%d/%y") + t.strftime("at %I:%M%p")
      log.puts green, action, clear
      log.puts file
      log.puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    end

    def self.bind_command(command)
      Dir.chdir()
      tmux_conf = File.open("tmux_tester.conf", "a")
      command.each {|line| tmux_conf.puts "#{line}\n"}
      log_write(command, "~/.tmux.conf")
    end 
   
   def self.divider
   puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
   end 
end

