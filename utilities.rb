module Utilities
  require 'rubygems'
  require 'bundler/setup'
  require 'term/ansicolor'
  extend Term::ANSIColor
  def self.anti_replication(file, no_replicate, reg)
    array = IO.readlines(file)
      array.each do |line|
        unless line =~ reg
          @found_line = false
        else
          @found_line = true
        end
      end
      if @found_line == false
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
      Dir.chdir()
      @home = Dir.pwd
      log = File.new("#{@home}/tmux_setup/log.txt", 'a')
      log.puts action
      log.puts file
    end 
  end

