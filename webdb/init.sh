gosu postgres postgres --single <<- EOSQL
    CREATE USER django;
    CREATE DATABASE webdb;
    GRANT ALL PRIVILEGES ON DATABASE webdb TO django;
EOSQL
