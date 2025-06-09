# Portainer

Effortless container management for Kubernetes, Docker, and Podman.


## Configuration

Make a copy of each of the `.template` files and remove the `.template` extension. Change any of the parameters as you see fit.


### Reverse Proxy with Caddy

To reverse proxy portainer with the caddy add the following configuration to your `Caddyfile`.

```Caddyfile
portainer.{$DUCKDNS_DOMAIN}:443 {
    reverse_proxy {
        to portainer:9443
        transport http {
            tls
            tls_insecure_skip_verify
        }
    }
}
```

And update to the domains section to include a portainer subdomain.

```Caddyfile
domains {
    {$DUCKDNS_DOMAIN} portainer
}
```

> Note: Don't forget to add portainer to the caddy network.

Also, you may need to add the following environment configuration to portainer.

```yaml
environment:
    VIRTUAL_HOST: ${VIRTUAL_HOST}
    VIRTUAL_PORT: ${WEB_UI_HTTPS_PORT:-9443}
```


## Documentation

Please see the [Portainer documentation][portainer_documentation].


## Homepage

Please see the [Portainer homepage][portainer_homepage].


## Source

Please see the [Portainer source code][portainer_source_code].



[portainer_documentation]: <https://docs.portainer.io/>
[portainer_homepage]: <https://www.portainer.io/>
[portainer_source_code]: <https://github.com/portainer/portainer>
