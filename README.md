# Sentinel Dashboard Docker

本项目是 [Sentinel Dashboard](https://github.com/alibaba/Sentinel/wiki/%E6%8E%A7%E5%88%B6%E5%8F%B0) Server的docker镜像的build源码,以及Sentinel Dashboard server 在docker的单机的运行例子.

[**英文**](README_EN.md)

## 项目目录

* build：Sentinel Dashboard 镜像制作的源码
* env: docker compose 环境变量文件
* example: docker-compose编排例子


## 运行环境

* [Docker](https://www.docker.com/)


## 快速开始

打开命令窗口执行：

* Clone project

  ```powershell
  git clone --depth 1 https://github.com/solvaysphere/sentinel-dashboard-docker.git
  cd sentinel-dashboard-docker
  ```
  
* Build Image
  ```powershell
  cd build
  docker build -t solvaysphere/sentinel-dashboard:1.8.2 -f build/Dockerfile .
  ```  
    
* Run With docker
  ```powershell
  docker run -p 8080:8080 -it solvaysphere/sentinel-dashboard:1.8.2
  ```  

* Standalone

  ```powershell
  docker-compose -f example/sentinel-dashboard.yaml up
  ```

* 打开浏览器

  link：http://127.0.0.1:8080


## 属性配置列表



| 属性名称                                            | 描述                                             | 选项                              |
| -------------------------------------------------- | ----------------------------------------------- | ------------------------------- |
| SERVER_PORT                                        | server启动的端口                                 | 默认 **8080**                    |
| CONTEXT_PATH                                       | CONTEXT PATH                                    | 默认 **/**                       |
| SENTINEL_DASHBOARD_SESSION_TIMEOUT                 | SESSION TIMEOUT                                 | 默认 **7200**                       |
| SENTINEL_DASHBOARD_COOKIE_NAME                     | COOKIE NAME                                     | 默认 **sentinel_dashboard_cookie**  |
| SENTINEL_AUTH_USERNAME                             | Sentinel Dashboard用户名称                        | 默认 **sentinel**                |
| SENTINEL_AUTH_PASSWORD                             | Sentinel Dashboard用户密码                        | 默认 **sentinel**                |
| SENTINEL_DASHBOARD_SERVER                          | 访问服务端连接地址                                 | 默认 127.0.0.1:8080              |
| SENTINEL_DASHBOARD_PROJECT_NAME                    | 项目名称                                          | 默认 sentinel-dashboard          |
| AUTH_ENABLED                                       | 是否开启登录鉴权,仅用于日常测试，生产上不建议关闭      | 默认 true                        |
| SENTINEL_DASHBOARD_APP_HIDEAPPNOMACHINEMILLIS      | 是否隐藏无健康节点的应用,距离最近一次主机心跳时间的毫秒数，默认关闭  | 默认 0    最小值: 60000  |
| SENTINEL_DASHBOARD_REMOVEAPPNOMACHINEMILLIS        | 是否自动删除无健康节点的应用，距离最近一次其下节点的心跳时间毫秒数，默认关闭  | 默认 0    最小值: 120000  |
| SENTINEL_DASHBOARD_UNHEALTHYMACHINEMILLIS          | 主机失联判定，不可关闭                                    | 默认 60000    最小值: 30000  |
| SENTINEL_DASHBOARD_AUTOREMOVEMACHINEMILLIS         | 距离最近心跳时间超过指定时间是否自动删除失联节点，默认关闭        | 默认 0    最小值: 300000  |
| JVM_XMS                                            | -Xms                                            | 默认 :1g                         |
| JVM_XMX                                            | -Xmx                                            | 默认 :1g                         |
| JVM_XMN                                            | -Xmn                                            | 默认 :512m                       |
| JVM_MS                                             | -XX:MetaspaceSize                               | 默认 :128m                       |
| JVM_MMS                                            | -XX:MaxMetaspaceSize                            | 默认 :320m                       |
| SENTINEL_DEBUG                                     | 是否开启远程DEBUG                                 | y/n 默认 :n                      |
| TOMCAT_ACCESSLOG_ENABLED                           | server.tomcat.accesslog.enabled                 | 默认 :false                      |
| SENTINEL_DASHBOARD_COOKIE                          |  cookie name setting                            | 默认 :sentinel_dashboard_cookie  |


参考例子: [sentinel-dashboard.yaml](https://github.com/solvaysphere/sentinel-dashboard-docker/blob/master/example/sentinel-dashboard.yaml)

