@echo off
echo Running Network Enumeration Lab 1
echo Commands and outputs saved to network_info.txt
echo --- Running ipconfig --- >> network_info.txt
ipconfig >> network_info.txt
echo --- Running netstat -ano --- >> network_info.txt
netstat -ano >> network_info.txt
echo --- Running ping 8.8.8.8 --- >> network_info.txt
ping 8.8.8.8 >> network_info.txt
echo Done! Check network_info.txt for results.