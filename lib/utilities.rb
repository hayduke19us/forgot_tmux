require 'term/ansicolor'
require 'bookshelf/categories'
require 'trail_head/setup'
module Utilities
  extend Term::ANSIColor

  def self.query
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "What do you need help with?"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-==-"
    question = gets.chomp
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
    unless question =~ /(exit|quit|nothing)/
      self.type_of_query(question)
    else
      puts "thanks"
    end
  end

  def self.type_of_query(phrase)
    phrase_array = phrase.split
    phrase_array.each do |word|
      Utilities.reg_helper(word)
    end
    self.query
  end


  def self.anti_replication(file, no_replicate, reg)
    Dir.chdir()
    found_line = false
    array = IO.readlines(file)
      array.each do |line|
        if line =~ Regexp.new(reg)
          found_line = true
        end
      end
      if found_line == false
        puts red, "no forgot_tmux alias found", clear
        bash_file = File.open(file, "a")
        bash_file.puts "# #{no_replicate}"
        bash_file.puts no_replicate
        puts green, "#{no_replicate} added to #{file}", clear
        bash_file.close
        log_write("##{no_replicate}", "#{file}")
        %x{echo 'source ~/.bashrc'}
      else
        puts red, "Found #{no_replicate} in #{file}", clear
      end
  end

    def self.progress_bar
      12.times do
        print magenta, ".", clear
        sleep 0.06
      end
    end

    def self.fast_progress_bar
      12.times do
        print magenta, ".", clear
        sleep 0.05
      end
    end

   def self.log_write(action, file)
      t = Time.now
      Dir.chdir()
      @home = Dir.pwd
      log = File.open("#{@home}/forgot_tmux/log.txt", "a")
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

   def self.reg_helper(word)
    if word =~ /(\Aw|ind..\z)/
      Categories.windows
    elsif word =~ /(\Asess|ion\z|\Aatt|ach\z)/
      Categories.sessions
    elsif word =~ /(\Apa|nes\z)/
      Categories.panes
    elsif word =~ /(\Acom|mand\z)/
      Categories.command_mode
    elsif word =~ (/\Aset|up\z/)
      Setup.initial_setup
    elsif word =~ (/\A.el|lp\z/)
      Categories.help
    end
  end
end
