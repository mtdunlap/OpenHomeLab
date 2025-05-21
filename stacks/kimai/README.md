# Kimai

[Kimai][kimai_homepage] is a professional grade time-tracking application, free and [open-source][kimai_source_code]. It handles use-cases of freelancers as well as companies with dozens or hundreds of users.

## Configuration

Make a copy of each of the `.template` files and remove the `.template` extension. Change any of the parameters as you see fit. Be sure to update the `connection_string.template` to use the same values as the environment variables set in the `.env` file.


### Exposing the database

To expose the database via the host machine add the following ports definition to `compose.yaml` under the `kimai_db` service and remove the `expose` definition.

```yaml
ports:
  - name: mysql
    target: 3306
    published: ${MYSQL_PORT}
    host_ip: 0.0.0.0
    protocol: tcp
    app_protocol: mysql
    mode: host
```


## Setup

After starting the service for the first time add a user.

```bash
docker exec -it kimai-web console kimai:user:create <username> <email> ROLE_SUPER_ADMIN
```


## Documentation

For further information on Kimai please view the [kimai documentation][kimai_documentation].


## Linuxserver.io

The containers are maintained by [linuxserver.io][linux_server_io_homepage], including [documentation][linux_server_io_kimai_documentation] and [source code][linux_server_io_kimai_source_code].



[kimai_documentation]: <https://www.kimai.org/documentation/>
[kimai_homepage]: <https://www.kimai.org/>
[kimai_source_code]: <https://github.com/kimai/kimai>
[linux_server_io_homepage]: <https://www.linuxserver.io/>
[linux_server_io_kimai_documentation]: <https://docs.linuxserver.io/images/docker-kimai/>
[linux_server_io_kimai_source_code]: <https://github.com/linuxserver/docker-kimai>
