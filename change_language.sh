#!/bin/bash
set -x 
change_lanugage() {
     docker exec -it shipyard-controller  rm -rf static/app 
     docker exec -it shipyard-controller  rm -f static/index.html
     git clone https://github.com/StarWars-Team/shipyard_zh.git
     docker cp  shipyard_zh/static/app  shipyard-controller:/static/
     docker cp  shipyard_zh/static/index.html  shipyard-controller:/static/
     mv shipyard_zh shipyard_zh-`date +%F`
}
change_lanugage
