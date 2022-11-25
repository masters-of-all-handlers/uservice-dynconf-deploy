all:
	git clone  https://github.com/masters-of-all-handlers/uservice-dynconf.git || echo "already created"
	git clone https://github.com/masters-of-all-handlers/auth-service.git || echo "already created"
	cd uservice-dynconf && git submodule update --init
	sudo chmod -R 777 uservice-dynconf/.git/modules/third_party/userver/config
	git config --global --add safe.directory /home/student/uservice-dynconf-deploy/auth-service
	sudo chmod -R 777  /home/student/uservice-dynconf-deploy/auth-service/.git
	cd auth-service && git submodule update --init
	sudo chmod -R 777 auth-service/.git/modules/third_party/userver/config
	docker-compose up --build
