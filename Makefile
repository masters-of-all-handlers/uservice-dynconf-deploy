all:
	git submodule update --init --recursive
	docker-compose up --build
