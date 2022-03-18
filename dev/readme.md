单机部署

### eureka-server

EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31 配置这个，才能跨主机通讯,表明该服务注册到eureka上的ip地址。否则将会是默认是docker内部地址。

```shell script
docker run --restart=always --name eureka-server -p 1111:1111 -v /apps/eureka-server/tmp:/tmp -v /apps/eureka-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 172.31.31.31/xrlj/eureka-server:0.0.1-dev
```

### config-server

```shell script
docker run --restart=always --name config-server -p 3333:3333 -v /apps/config-server/tmp:/tmp -v /apps/config-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 172.31.31.31/xrlj/config-server:0.0.1-dev
```

### api-gateway
对外端口可见
```shell script
docker run --restart=always --name api-gateway -p 5555:5555 -v /apps/api-gateway/tmp:/tmp -v /apps/api-gateway/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 172.31.31.31/xrlj/api-gateway:0.0.1-dev
```

### service-sys-genid-provider

```shell script
docker run --restart=always --name service-sys-genid -p 9013:9013 -v /apps/service-sys-genid/tmp:/tmp -v /apps/service-sys-genid/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 172.31.31.31/xrlj/service-sys-genid-provider:0.0.1-dev
```

### service-auth

```shell script
docker run --restart=always --name service-auth -p 9017:9017 -v /apps/service-auth/tmp:/tmp -v /apps/service-auth/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 172.31.31.31/xrlj/service-auth-provider:0.0.1-dev
```

### service-usercentral

```shell script
docker run --restart=always --name service-usercentral -p 9015:9015  -v /apps/service-usercentral/tmp:/tmp -v /apps/service-usercentral/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=192.168.0.48" -d 镜像
```

### service-sys-common
```shell script
docker run --restart=always --name service-sys-common -p 9000:9000  -v /apps/service-sys-common/tmp:/tmp -v /apps/service-sys-common/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=192.168.0.48" -d 镜像
```

### service-ebook

```shell script
docker run --restart=always --name service-ebook -p 9033:9033 -v /apps/service-ebook/tmp:/tmp -v /apps/service-ebook/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=192.168.0.48" -d 镜像
```

### service-sys-filesystem

```shell script
docker run --restart=always --name service-sys-filesystem -p 9020:9020  -v /apps/service-sys-filesystem/tmp:/tmp -v /apps/service-sys-filesystem/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 镜像
```

```shell script
docker run --restart=always --name service-esign -p 9022:9022  -v /apps/service-esign/tmp:/tmp -v /apps/service-esign/logs:/logs -e "SPRING_PROFILES_ACTIVE=dev" -e "EUREKA_INSTANCE_IP-ADDRESS=172.31.31.31" -d 镜像
```
