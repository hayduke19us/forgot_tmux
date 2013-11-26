module Routes
  require 'rubygems'
  require 'bundler/setup'

  PATH = "~/tmux_setup/"
  
  SIMPLE_WALK = PATH + "course/simple_walk.rb"
  AUTO_SIMPLE = PATH + "course/auto_simple.rb"
  COMPLEX_WALK = PATH + "course/complex_walk.rb"
  AUTO_COMPLEX = PATH + "course/auto_complex.rb"
  
  QUESTION_PARSER = PATH + "tools/question_parser.rb"
  UTILITIES = PATH + "tools/utilities.rb"
  
  BINDINGS = PATH + "library/bindings.rb"
  NOTES = PATH + "library/notes.rb"
  CATEGORIES = PATH + "library/categories.rb"
  
  SETUP = PATH + "trail_head/setup.rb"
  START = PATH + "trail_head/start.rb"

  require Routes::UTILITIES
end
