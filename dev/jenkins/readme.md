#### 安装maven插件，构建lib，发布到nexus私服。

#### docker应用发布

直接新建自由项目。

配置git，添加相应账号密码凭证。

连接远程服务器执行脚本：


```shell
echo "开始构建doker镜像》》》》"
source /etc/profile
mvn -v
cd /server/dockers/jenkins/workspace/api-gateway
mvn clean install -Plocal dockerfile:build

# echo "上传docker镜像到私服》》》》" #开发环境无需上传开发环境无需上传
# cat ~/.docker.login.pwd | docker login --username admin --password-stdin 192.168.0.3:8082
# mvn clean install -Plocal dockerfile:push

echo "运行docker容器》》》》"
docker inspect api-gateway -f  '{{.Id}}'
if [[ $? != 0 ]]; then
  echo "启动容器"

  docker run --restart=always --name api-gateway -p 5555:5555 -v /apps/api-gateway/tmp:/tmp -v /apps/api-gateway/logs:/logs -e "SPRING_PROFILES_ACTIVE=local" -e "EUREKA_INSTANCE_IP-ADDRESS=192.168.0.3" -d 192.168.0.3:8082/xrlj/api-gateway:0.0.1-local
else
  echo "删除该版本在运行容器并重新运行"

  docker rm -f api-gateway
  
 docker run --restart=always --name api-gateway -p 5555:5555 -v /apps/api-gateway/tmp:/tmp -v /apps/api-gateway/logs:/logs -e "SPRING_PROFILES_ACTIVE=local" -e "EUREKA_INSTANCE_IP-ADDRESS=192.168.0.3" -d 192.168.0.3:8082/xrlj/api-gateway:0.0.1-local  

fi
```
