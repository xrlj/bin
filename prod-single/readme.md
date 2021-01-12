### eureka-server

docker run --restart=always --name eureka-server -p 1111:1111 -v /apps/eureka-server/tmp:/tmp -v /apps/eureka-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod" -d 8.210.22.230:8082/xrlj/eureka-server:0.0.1-release

### config-server

docker run --restart=always --name config-server -p 3333:3333 -v /apps/config-server/tmp:/tmp -v /apps/config-server/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod" -d 8.210.22.230:8082/xrlj/config-server:0.0.1-release

### service-sys-genid-provider

docker run --restart=always --name service-sys-genid -p 9014:9014 -v /apps/service-sys-genid/tmp:/tmp -v /apps/service-sys-genid/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod" -d 8.210.22.230:8082/xrlj/service-sys-genid-provider:0.0.1-release

### service-auth

docker run --restart=always --name service-auth -p 9017:9017 -v /apps/service-auth/tmp:/tmp -v /apps/service-auth/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod" -d 8.210.22.230:8082/xrlj/service-auth-provider:0.0.1-release

### api-gateway

docker run --restart=always --name api-gateway -p 5555:5555 -v /apps/api-gateway/tmp:/tmp -v /apps/api-gateway/logs:/logs -e "SPRING_PROFILES_ACTIVE=prod" -d 8.210.22.230:8082/xrlj/api-gateway:0.0.1-release
