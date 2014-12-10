function sfenv {
  export BASE="$HOME/source/sf-webapp"

  cd $BASE

  tmux start-server
  tmux new-session -d -s spredfast -n vim
  tmux new-window -t spredfast:1 -n gradle
  tmux new-window -t spredfast:2 -n jetty
  tmux new-window -t spredfast:3 -n shell
  tmux new-window -t spredfast:4 -n style-guide
  tmux new-window -t spredfast:5 -n qa
  tmux new-window -t spredfast:6 -n js-core

  tmux send-keys -t spredfast:0 "cd $BASE/jmvc/src/main/jmvc; vim ." C-m
  tmux send-keys -t spredfast:1 "cd $BASE/jmvc; rm -Rf ~/.m2/repository/org/slf4j/;" C-m
  tmux send-keys -t spredfast:2 "cd $BASE/java; vagrant up; ./gradlew jettyRun" C-m
  tmux send-keys -t spredfast:3 "cd $BASE/jmvc/src/main/jmvc" C-m
  tmux send-keys -t spredfast:4 "cd $HOME/source/sf-styleguide; vim ." C-m
  tmux send-keys -t spredfast:5 "cd $HOME/source/sf-qa; vim ." C-m
  tmux send-keys -t spredfast:5 "cd $HOME/source/sf-sf-webui-js-core; vim ." C-m

  tmux select-window -t spredfast:2
  tmux attach-session -t spredfast
}
