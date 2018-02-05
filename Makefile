travis-before-install-backend:
	sudo rm -f /etc/boto.cfg

travis-install-backend:
	pip install awscli
	pip install -r ./requirements.txt

travis-before-script-backend:
	mkdir -p ~/$(TRAVIS_BRANCH)/databases/
	touch ~/$(TRAVIS_BRANCH)/databases/db.sql
	aws s3 sync s3://org-travis-ci/$(TRAVIS_BRANCH) ~/$(TRAVIS_BRANCH)
	mysql --user='root' --password='' -e 'CREATE DATABASE IF NOT EXISTS test_project;'
	@case $$TRAVIS_COMMIT_MESSAGE in *"[reset mysql]"*) \
		echo 'Resetting MySQL database...'; \
		aws s3 rm s3://org-travis-ci/$(TRAVIS_BRANCH)/databases/db.sql; \
	;; *) \
		echo 'Loading previous MySQL database...'; \
		mysql --user='root' --password='' test_project < ~/$(TRAVIS_BRANCH)/databases/db.sql; \
	esac

travis-test-backend:
	cd project; python manage.py test --keepdb --failfast -v 3 project

travis-noop:
	@echo "Move along..."
