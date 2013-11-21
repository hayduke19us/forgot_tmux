module Bindings
  
  @file = "~/tester_bester.conf"

  def self.prefix
    %x{echo "#"unbind ctrl b >> #{@file}
       echo unbind C-b >> #{@file}
       echo "#"change prefix to ctrl a >> #{@file} 
       echo set -g prefix C-a >> #{@file}}

  end
  def self.escape_time
    %x{echo "#"change command escape time to interact with vim better >> #{@file}
       echo  set -sg escape-time >> #{@file}}
      
  end
  
  def self.reload_conf
    %x{echo "#"add a hot key for sourcing the .tmux.conf file >> #{@file} 
       echo bind r source-file ~/.tmux.conf \; display "Reloaded!" >> #{@file}} 
  end

end
