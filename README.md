# forgot_tmux

  Forgot Tmux is a script that helps you set up your tmux configuration file. It also provides you with a quick reference to tmux commands. There are two current options:

**SimpleWalk**: creates a .tmux.conf file and walks you thru the configuration process of binding keys with notes.

**AutoSimple**: creates a .tmux.conf file and automatically
populates the file with most necessary key bindings.
***

#### Getting Started:

1. Clone the repository into your $HOME dir:

`git clone https://github.com/hayduke19us/tmux_setup.git`

2. In the command line:

`ruby ~/forgot_tmux/lib/tmux_setup.rb`

3. Finished!

#### Commands:

Type `forgot_tmux` in the command line to access the script. The input takes various arguments. 

**'setup'** : Will give you four setup options from simple to         
complex. From a step by step key binding to a quick automated setup for the busy developer.
  
**'help'**  : Will list all applicable query inputs.

#### Coming Soon:

**Complex_Walkthru Setup**: More then just the necessary keybindings. All the bells and whistles setup within a dotfile with _git init_. Includes a walk thru similar to Simple_Walkthru set up.

**AutoComplex Setup**: Everything that Complex_Walkthru offers except automated.

**Tutorial**: An interactive tutorial that helps you hone your Tmux skills. 