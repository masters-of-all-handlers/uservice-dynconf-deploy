all:
	git clone  https://github.com/masters-of-all-handlers/uservice-dynconf.git || echo "already created"
	git clone https://github.com/masters-of-all-handlers/auth-service.git || echo "already created"

	sudo chmod -R 777 uservice-dynconf/.git/modules/third_party/userver/config

	sudo chmod -R 777 auth-service/.git
	sudo chmod -R 777 auth-service/.git/modules
	sudo chmod -R 777 auth-service/.git/modules/third_party
	sudo chmod -R 777 auth-service/.git/modules/third_party/userver
	sudo chmod -R 777 auth-service/.git/modules/third_party/userver/config
	git config --global --add safe.directory ./auth-service

	cd uservice-dynconf && git submodule update --init
	cd auth-service && git submodule update --init

	docker-compose up --build
