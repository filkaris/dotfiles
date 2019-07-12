# Learning Docker & Cheatsheet

## Connect to a running mariadb instance

This command creates a new container on the spot, which is deleted afterwards (--rm)

It is started in the same network as the desired database container you want to connect to (--network)

The imagename is mariadb (mariadb)

It just runs `mysql -hHOSTNAME -uUNAME -p123456 DB`

```
docker run -it --rm --network docker-mysql-with-admin_default mariadb mysql -hmy-db -uroot -p123456 crm
```
