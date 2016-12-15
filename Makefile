docker: docker-ubuntu

docker-debian: pre-install debian-repository install-latest post-install install-compose
docker-ubuntu: pre-install ubuntu-repository install-latest post-install install-compose

pre-install:
	# Pre install
	ansible-playbook main.yml -i localhost -t docker_pre_install

debian-repository:
	# Debian repository
	ansible-playbook main.yml -i localhost -t docker_debian_repository

ubuntu-repository:
	# Ubuntu repository
	ansible-playbook main.yml -i localhost -t docker_ubuntu_repository

install-latest:
	# Install latest version
	ansible-playbook main.yml -i localhost -t docker_install_latest

install-old:
	# Install older version
	ansible-playbook main.yml -i localhost -t docker_install_old

post-install:
	# Post install
	ansible-playbook main.yml -i localhost -t docker_post_install

configure-daemon:
	# Docker daemon
	ansible-playbook main.yml -i localhost -t docker_daemon

install-compose:
	# Docker compose install
	ansible-playbook main.yml -i localhost -t docker_compose_install
