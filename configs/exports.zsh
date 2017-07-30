# Tell ls to be colourful
#export BYOBU_PREFIX=/export2/homes/amaheshw/installed/byobu
#export CATALINA_HOME=$HOME/tomcat7
# Tell grep to highlight matches
#export GREP_OPTIONS=' --color=always'
#export MY_HOME=/export2/homes/amaheshw
export ANT_HOME=$HOME/installed/ant
export MAVEN_HOME=$HOME/installed/maven
export MAHOUT_HOME=$HOME/installed/mahout
export JAVA_HOME=$HOME/installed/java
export GOPATH=/Users/abhim/go-workspace
export GOROOT=/usr/local/go
export OOZIE_HOME=$HOME/installed/oozie
export HADOOP_PREFIX=$HOME/installed/hadoop
export HIVE_HOME=$HOME/installed/hive
export PIG_HOME=$HOME/installed/pig
export SPARK_HOME=$HOME/installed/spark
export GIRAPH_HOME=$HOME/installed/giraph
export PRESTO_HOME=$HOME/installed/presto
export GRADLE_HOME=$HOME/installed/gradle
export HBASE_HOME=$HOME/installed/hbase
export AWS_CLI=$HOME/.local/lib/aws
export AWS_DEFAULT_PROFILE=s2
#export SCALA_HOME=$HOME/installed/scala
#export HADOOP_MAPRED_HOME=$HADOOP_HOME
#export HADOOP_COMMON_HOME=$HADOOP_HOME
#export HADOOP_HDFS_HOME=$HADOOP_HOME
#export HADOOP_YARN_HOME=$HADOOP_HOME
#export YARN_HOME=$HADOOP_HOME
#export YARN_CONF_DIR=$HADOOP_CONF_DIR
#export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
#export HADOOP_OPTS="-Djava.library.path=$HADOOP_PREFIX/lib/native $HADOOP_OPTS"
export GREP_OPTIONS="--color=always"
export SVN_EDITOR=vim
export EDITOR=vim
export MAVEN_OPTS="-Xmx4G -XX:ReservedCodeCacheSize=512m -Djava.awt.headless=true -Dapple.awt.UIElement=true"
export GRADLE_OPTS="-Xmx4G -XX:ReservedCodeCacheSize=512m -Djava.awt.headless=true -Dapple.awt.UIElement=true"
#export MAVEN_OPTS="-Xmx4G -XX:MaxPermSize=512m -XX:ReservedCodeCacheSize=512m -Djava.awt.headless=true -Dapple.awt.UIElement=true"
#export GRADLE_OPTS="-Xmx4G -XX:MaxPermSize=512m -XX:ReservedCodeCacheSize=512m -Djava.awt.headless=true -Dapple.awt.UIElement=true"
export ANDROID_HOME="/Users/abhim/Library/Android/sdk"
#export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.tbz=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:"
#export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=Exfxcxdxbxegedabagacad
export HISTTIMEFORMAT="%d/%m/%y %T "
export IDEA_IGNORE="*.idea;*.iml;*.pyc;*.pyo;*.rbc;*~;.*;CVS;RCS;SCCS;__pycache__;_svn;rcs;vssver.scc;vssver2.scc;build;"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export HISTCONTROL=erasedups
export HISTSIZE=99999

folders=( /usr/local/git/bin /usr/local/mysql/bin /opt/subversion/bin $ANDROID_HOME/platform-tools $HOME/installed/byobu/bin $HOME/installed/gnuplot/bin $MAVEN_HOME/bin $ANT_HOME/bin $MAHOUT_HOME/bin $PRESTO_HOME/bin $PIG_HOME/bin $SPARK_HOME/bin $SPARK_HOME/sbin $HADOOP_PREFIX/bin $HADOOP_PREFIX/sbin $GIRAPH_HOME/bin $OOZIE_HOME/bin $HOME/installed/bindfs/bin $HBASE_HOME/bin $GRADLE_HOME/bin $JAVA_HOME/bin $HOME/bhim/bhim.bin $GOROOT/bin $GOPATH/bin $AWS_CLI/bin)
for folder in "${folders[@]}"; do
	if [ -d "$folder" ] ; then
#		echo $folder
		PATH="$folder:$PATH"
	fi
done
export mapred_app_classpath="`hadoop classpath | tr ":" ","`,$PIG_HOME/pig-withouthadoop.jar"
alias macp="echo $mapred_app_classpath"
export yarn_app_classpath="`yarn classpath | tr ":" ","`"
alias yacp="echo $yarn_app_classpath"
export cdbug=" -Dstandalone.client.debug=true"
export sdbug=" -Dmaven.surefire.debug=true"
export mts=" -Dmaven.test.skip=true"
#export LD_LIBRARY_PATH="$HADOOP_PREFIX/lib/native:$LD_LIBRARY_PATH"
#export MYSQL_HOME="/usr/local/mysql"
#export ARTIFACTORY_HOME="/opt/artifactory"
#export BOOST_ROOT='/act/boost/boost_1_42_0'
