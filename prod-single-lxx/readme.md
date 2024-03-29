单机部署

### eureka-server

EUREKA_INSTANCE_IP-ADDRESS=192.168.0.49 配置这个，才能跨主机通讯,表明该服务注册到eureka上的ip地址。否则将会是默认是docker内部地址。

```shell script
docker run --restart=always --name eureka-server -p 1111:1111 -v /apps/eureka-server/tmp:/tmp -v /apps/eureka-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 8.210.22.230:8082/xrlj/eureka-server:0.0.1-release
```

### config-server

```shell script
docker run --restart=always --name config-server -p 3333:3333 -v /apps/config-server/tmp:/tmp -v /apps/config-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 8.210.22.230:8082/xrlj/config-server:0.0.1-release
```

### api-gateway
对外端口可见
```shell script
docker run --restart=always --name api-gateway -p 5555:5555 -v /apps/api-gateway/tmp:/tmp -v /apps/api-gateway/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 8.210.22.230:8082/xrlj/api-gateway:0.0.1-release
```

### service-auth

```shell script
docker run --restart=always --name service-auth -p 9017:9017 -v /apps/service-auth/tmp:/tmp -v /apps/service-auth/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 8.210.22.230:8082/xrlj/service-auth-provider:0.0.1-release
```

### service-usercentral

```shell script
docker run --restart=always --name service-usercentral -p 9015:9015  -v /apps/service-usercentral/tmp:/tmp -v /apps/service-usercentral/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 镜像
```

### service-sys-common
```shell script
docker run --restart=always --name service-sys-common -p 9000:9000  -v /apps/service-sys-common/tmp:/tmp -v /apps/service-sys-common/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 镜像
```


### service-esign
```shell script
docker run --restart=always --name service-esign -p 9022:9022  -v /apps/service-esign/tmp:/tmp -v /apps/service-esign/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod-single-lxx" -e "EUREKA_INSTANCE_IP-ADDRESS=172.16.19.211" -d 镜像
```
