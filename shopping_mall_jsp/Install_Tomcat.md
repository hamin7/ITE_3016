// Chapter 02 톰캣 설치 및 실행
// http://igeniusdo.tistory.com/12 

Last login: Wed Sep 19 15:48:08 on ttys000
-bash: feff: No such file or directory
-bash: feff: No such file or directory
hamins-MacBook-Pro:~ hamin$ sudo mkdir -p /usr/local
Password:
hamins-MacBook-Pro:~ hamin$ sudo mv ~/Downloads/apache-tomcat-8.5.34 /usr/local
hamins-MacBook-Pro:~ hamin$ sudo rm -f /Library/Tomcat
hamins-MacBook-Pro:~ hamin$ sudo ln -s/usr/local/apache-tomcat-8.0.8 /Library/Tomcat
ln: illegal option -- /
usage: ln [-Ffhinsv] source_file [target_file]
       ln [-Ffhinsv] source_file ... target_dir
       link source_file target_file
hamins-MacBook-Pro:~ hamin$ sudo ln -s /usr/local/apache-tomcat-8.5.34 /Library/Tomcat
hamins-MacBook-Pro:~ hamin$ sudo chown -R hamin /Library/Tomcat
hamins-MacBook-Pro:~ hamin$ sudo chmod +x /Library/Tomcat/bin/*.sh
hamins-MacBook-Pro:~ hamin$ /Library/Tomcat/bin/startup.sh
Using CATALINA_BASE:   /Library/Tomcat
Using CATALINA_HOME:   /Library/Tomcat
Using CATALINA_TMPDIR: /Library/Tomcat/temp
Using JRE_HOME:        /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home
Using CLASSPATH:       /Library/Tomcat/bin/bootstrap.jar:/Library/Tomcat/bin/tomcat-juli.jar
Tomcat started.
hamins-MacBook-Pro:~ hamin$

// https://localhost:8080/
