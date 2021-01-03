# Configure bash shell to use powerline by default.
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/work/go/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH:$HOME/work/go/bin"
fi
export GO111MODULE=on
export GOPATH=$HOME/work/go
export PATH

if ! [[ "$PYTHONPATH" =~ "$PATH" ]]
then
    PYTHONPATH=$PATH:$PYTHONPATH
fi
export PYTHONPATH

function image-build-and-push() {                                                                                       
        export DOCKER_ORG=nargaman                                                                                      
        export TAG=nargaman                                                                                             
        docker build . -t quay.io/${DOCKER_ORG}/${PWD##*/}:${TAG}                                                       
        docker login                                                                                                    
        docker push quay.io/${DOCKER_ORG}/${PWD##*/}:${TAG}                                                             
}                                                                                                                       
function github-delete-branch() {                                                                                       
        echo "deleting branch $1 localy and nirarg/$1 remotely"                                                         
        git push -d nirarg $1                                                                                           
        git branch -D $1                                                                                                
}
function docker-clean-resources() {
        docker volume prune ; docker system prune ; docker images -q | tail -n 200 | xargs docker rmi
}
function base64-encode-file() {
	if [$1 == ""]
	then
		echo "Error: File path must be provided"
		return
	fi
	base64 -w 0 $1
	echo ""
}
function base64-decode() {
	if [$1 == ""]
	then
		echo "Error: base64 encoded string must be provided"
		return
	fi
	echo $1 | base64 -d
}
