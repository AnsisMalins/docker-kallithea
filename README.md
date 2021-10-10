An up to date Kallithea docker container.

* Python version: 3.9
* Kallithea version: 0.7
* Mercurial version: 5.8

Don't forget to change ADMIN_PASSWORD.

I expect you to put this container behind an Nginx reverse proxy, with SSL. When you do, I recommend these settings:
```
location /hg/ {
    proxy_pass http://127.0.0.1:5000;
    client_max_body_size 100g;
    proxy_http_version 1.1;
    proxy_buffering off;
    proxy_request_buffering off;
    proxy_read_timeout 600s;
    proxy_send_timeout 600s;
}
```
