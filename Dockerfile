FROM  centos:7
  
ADD jdk-8u211-linux-x64.tar.gz /usr/local
ENV     JAVA_HOME    /usr/local/jdk1.8.0_211
ENV     JRE_HOME     /usr/local/jdk1.8.0_211/jre
ENV     CLASSPATH    .:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
ENV     PATH         $PATH:$JAVA_HOME/bin:$JRE_HOME/bin

ARG app
ADD $app app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
