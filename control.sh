#!/bin/bash
stopall() {
	docker ps -a|awk '{print $1}'|xargs docker stop
	docker ps -a|awk '{print $1}'|xargs docker rm
}
startall() {
	/data/shell/deploy.sh
        /data/shell/change_language.sh
	docker run -d -p 5000:5000 --restart=always -v /opt/data/registry:/usr/local/src/registry  --name registry registry
}
case $1 in
	stop)
		stopall;;
	start)
		startall;;
        restart)
		stopall
		startall
		;;
	*)
		;;
esac
