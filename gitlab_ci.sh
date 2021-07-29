#!/bin/bash
	apt-get install -y curl openssh-server ca-certificates tzdata perl
	curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
	apt-get install gitlab-ce
       	EXTERNAL_URL="http://3.123.33.30"
	grep password
