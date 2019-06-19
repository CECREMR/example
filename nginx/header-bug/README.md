
启动docker
```
docker run --name my-custom-nginx-container -v ~/example/nginx/header-bug/default.conf:/etc/nginx/nginx.conf:ro -d nginx
```
## default.conf
普通`Nginx`配置时无法获取到带下划线的`header`名称
curl
```bash
$ curl -i -X GET \
   -H "x_test: test"  'localhost:10000'
HTTP/1.1 200 OK
Server: nginx/1.17.0
Date: Wed, 19 Jun 2019 11:25:18 GMT
Content-Type: text/plain
Content-Length: 11
Connection: keep-alive

172.17.0.1
```

```bash
$ curl -i -X GET \
   -H "x-test: test"  'localhost:10000'
HTTP/1.1 200 OK
Server: nginx/1.17.0
Date: Wed, 19 Jun 2019 11:25:46 GMT
Content-Type: text/plain
Content-Length: 15
Connection: keep-alive

172.17.0.1
test%
```


## underscores_in_headers on
当开启`underscores_in_headers`参数后可以获取到对应参数
```bash
$ curl -i -X GET \
   -H "x_test: test"  'localhost:10000'
HTTP/1.1 200 OK
Server: nginx/1.17.0
Date: Wed, 19 Jun 2019 11:27:26 GMT
Content-Type: text/plain
Content-Length: 15
Connection: keep-alive

172.17.0.1
test%
```

## cookie
cookie中的下划线不受影响
```bash
curl -i -X GET \
 -H "cookie: x_test=1" 'localhost:10000'
HTTP/1.1 200 OK
Server: nginx/1.17.0
Date: Wed, 19 Jun 2019 11:30:52 GMT
Content-Type: text/plain
Content-Length: 19
Connection: keep-alive

172.17.0.1
1
```
但cookie

