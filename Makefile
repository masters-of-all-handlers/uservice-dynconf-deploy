all:
	git clone  https://github.com/masters-of-all-handlers/uservice-dynconf.git || echo "already created"
	git clone https://github.com/masters-of-all-handlers/auth-service.git || echo "already created"

	cd uservice-dynconf && git submodule update --init
	cd auth-service && git submodule update --init
	sudo chown -R ${USER} uservice-dynconf/.git/modules/third_party/userver/config
	sudo chown -R ${USER} auth-service/.git/modules/third_party/userver/config
	sudo chmod -R 777 auth-service
	sudo chmod -R 777 auth-service/.git
	sudo chmod -R 777 auth-service/.git/modules
	sudo chmod -R 777 auth-service/.git/modules/third_party
	sudo chmod -R 777 auth-service/.git/modules/third_party/userver
	sudo chmod -R 777 auth-service/.git/modules/third_party/userver/config
	git config --global --add safe.directory ./auth-service


	sudo chmod -R 777 uservice-dynconf
	sudo chmod -R 777 uservice-dynconf/.git
	sudo chmod -R 777 uservice-dynconf/.git/modules
	sudo chmod -R 777 uservice-dynconf/.git/modules/third_party
	sudo chmod -R 777 uservice-dynconf/.git/modules/third_party/userver
	sudo chmod -R 777 uservice-dynconf/.git/modules/third_party/userver/config
	git config --global --add safe.directory ./uservice-dynconf

	docker pull ghcr.io/masters-of-all-handlers/uda-frontend:latest

	docker-compose up -d --pull always --build

rerun-auth:
	cd auth-service && git stash
	cd auth-service && git pull --rebase
	docker-compose up -d --build --force-recreate auth-service

rerun-dynconf:
	cd uservice-dynconf && git stash
	cd uservice-dynconf && git pull --rebase
	docker-compose up -d --build --force-recreate uservice-dynconf

rerun-front:
	docker pull ghcr.io/masters-of-all-handlers/uda-frontend:latest
	docker-compose up -d --build --force-recreate webapp

