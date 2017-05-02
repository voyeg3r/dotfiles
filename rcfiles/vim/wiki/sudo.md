
In order to allow a regular user to use sudo command do this:
edite the file /etc/sudoers

  adding this

  user ALL=(ALL) ALL


### Runing multiple commands with sudo
+ https://www.cyberciti.biz/faq/how-to-run-multiple-commands-in-sudo-under-linux-or-unix/


      sudo -- sh -c 'command1 && command2'

Understanding sudo command options

    -- : A — signals the end of options and disables further option processing for sudo command.
    sh -c : Run sh shell with given commands


