// Chapter 02 톰캣 설치 및 실행
// http://igeniusdo.tistory.com/12 

Last login: Sat Sep 22 23:49:15 on ttys000
-bash: feff: No such file or directory
-bash: feff: No such file or directory
hamins-MacBook-Pro:~ hamin$ clear
hamins-MacBook-Pro:~ hamin$ sudo mkdir -p /usr/local
Password:
hamins-MacBook-Pro:~ hamin$ sudo mv ~/Downloads/apache-tomcat-8.0.53 /usr/local
mv: rename /Users/hamin/Downloads/apache-tomcat-8.0.53 to /usr/local/apache-tomcat-8.0.53: Directory not empty
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
