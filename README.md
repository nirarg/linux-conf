# linux-conf

1. Clone this repository to your computer to <root-dir>
2. Add line to ~/.bashrc: 
```console
# Source my configuration from 
export LINUX_CONF_PATH=<root-dir>/linux-conf
github                                                                                   
if [ -f $LINUX_CONF_PATH/bashrc ]; then                                                                  
        . $LINUX_CONF_PATH/xbashrc                                                                        
fi 
```
3. Add the following lines to ~/.vimrc:<br/>
```console
source $LINUX_CONF_PATH/main-vimrc
```