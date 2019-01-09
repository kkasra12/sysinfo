#!/bin/bash
mes='system_general_info\tShows systems general  information
   \nsystem_security_info\tShows systems security information
   \nsystem_hardware_info\tShows systems hardware information'

if [ $# == 1 ]; then
  if [ "$1" == "system_general_info" ]; then
    echo -e "CPU info:"
    lscpu
    echo -e "-------------------------------\nOS name and info:"
    uname -a
    echo -e "-------------------------------\ngcc version"
    gcc --version
    echo -e "-------------------------------\nUptime:"
    uptime
    echo -e "-------------------------------\nAll the processes in the system:"
    ps -A
    echo -e "--------------------------------\nTen processes using high memory:"
    ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -10


  elif [ $1 == "system_security_info" ]; then
    echo -e "Online users:"
    w
    echo -e "-------------------------------\nAvailable groups on system:"
    grpups
    echo -e "-------------------------------\nActive services on system:"
    service --status-all
    echo -e "-------------------------------\nAll softwares on system:"
    ls /usr/bin
  elif [ $1 == "system_hardware_info" ]; then
    echo "CPU info:"
    cat /proc/cpuinfo
    echo -e "--------------------------------\nHDD info:"
    lshw -class storage
    echo -e "--------------------------------\nNetwork card(s):"
    lshw -class network
    echo -e "--------------------------------\nConnected display(s):"
    lshw -class display
  else
      echo -e "wrong input :/\n\n\n"
      echo -e $mes
  fi
else
  echo -e $mes
fi
