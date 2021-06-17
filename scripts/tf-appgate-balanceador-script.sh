#!/bin/sh

yum install haproxy -y

echo "
#Habilitación proxy haproxy
defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000
#Habilitacion acceso estadisticas a traves haproxy?appgate-stats sin autenticacion
frontend http_front
   bind *:80
   stats uri /appgate-stats
   default_backend http_back
   # !!!: normally you would not want to expose this, only for demo
   # this allows anyone to easily take backends down/up/etc via panel
   stats admin if TRUE
backend http_back
    balance     roundrobin
" > /etc/haproxy/haproxy.cfg
#Copiamos el archivo del servicio de proxy
cp /usr/lib/systemd/system/haproxy.service /etc/systemd/system/haproxy.service
#Habilitamos el servicio
systemctl enable /etc/systemd/system/haproxy.service
#arrancamos el servicio
systemctl start haproxy.service