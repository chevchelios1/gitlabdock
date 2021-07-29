#!/bin/bash
      sed -i "s/PasswordAuthentification no/PasswordAuthentification yes/" /etc/ssh/sshd_config
      systemctl restart sshd.service
      sudo apt update
      sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
      sudo apt-get update
      echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |
  tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get install -y docker-ce docker-ce-cli containerd.io
      sed -i "s/#Port 22/Port 1488/" /etc/ssh/sshd_config
      if [ $(id -u) -eq 0 ]; then
        read -p "Enter username : " username
        read -s -p "Enter password : " password
        egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
          echo "$username exists!"
          exit 1
        else
          pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
          useradd -m -p "$pass" "$username"
          [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
      else
        echo "Only root may add a user to the system."
        exit 2

      fi
