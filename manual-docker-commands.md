Running the database as a daemon

    docker run -d --name=testdb1 vagrant_db

Running the web service manually

    docker run -i -t --name=testapp1 --expose 8000 --link testdb1:db vagrant_app /bin/bash
    python manage.py runserver 0.0.0.0:80
