# Caddy

The ultimate server makes your sites more secure, more reliable, and more scalable than any other solution.


## Configuration

Make a copy of each of the `.template` files and remove the `.template` extension. Change any of the parameters as you see fit.


### Creating the caddy-network

The caddy stack is configured to use an external network so that other services can easily connect to it. To create this network run.

```bash
docker network create --driver bridge caddy-network
```


### Dynamic DNS

If you have a dynamic IP address (many home internet connections do), then your IP address will occassionally change, breaking your domain names. To remedy this you will need a dynamic dns provider.

The caddy stack uses [DuckDNS][duckdns] as a free provider for dynamic dns. If you find DuckDNS useful, please consider donating to them.

> Note: Other dynamic dns providers are available such as [cloudflare dynamic dns][cloudflare_dynamic_dns], but DuckDNS is free and simple to get started with.


### Service reverse proxy configuration

The reverse proxy configuration for each service will vary and is beyond the scope of a single document. However, when possible,
reverse proxy examples will be provided in each stacks README.


## Documentation

Please see the [Caddy documentation][caddy_documentation].


## Homepage

Please see the [Caddy homepage][caddy_homepage].


## Source

Please see the [Caddy source code][caddy_source_code].



[caddy_documentation]: <https://caddyserver.com/docs/>
[caddy_homepage]: <https://caddyserver.com/>
[caddy_source_code]: <https://github.com/caddyserver/caddy>
[cloudflare_dynamic_dns]: <https://www.cloudflare.com/learning/dns/glossary/dynamic-dns/>
[duckdns]: <https://duckdns.org>
