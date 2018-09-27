hamins-MacBook-Pro:~ hamin$ sudo lsof -i :8080
Password:
COMMAND  PID  USER   FD   TYPE            DEVICE SIZE/OFF NODE NAME
java    5302 hamin   35u  IPv6 0xa75cf6eb716f61d      0t0  TCP *:http-alt (LISTEN)
hamins-MacBook-Pro:~ hamin$ kill -9 5302
hamins-MacBook-Pro:~ hamin$
