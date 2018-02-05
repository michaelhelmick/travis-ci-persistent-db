travis-before-install-backend:
	sudo rm -f /etc/boto.cfg

travis-install-backend:
	pip install awscli
	pip install -r ./requirements.txt

travis-before-script-backend: travis-noop

travis-test-backend: travis-noop

travis-noop:
	@echo "Move along..."
