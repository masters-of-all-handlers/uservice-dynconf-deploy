all:
	git submodule update --init
	docker-compose up --build
