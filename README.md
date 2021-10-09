# Sentinel Dashboard Docker
![Docker Stars](https://img.shields.io/docker/stars/solvaysphere/sentinel-dashboard.svg?color=green) ![Docker Pulls](https://img.shields.io/docker/pulls/solvaysphere/sentinel-dashboard.svg) ![Docker Image Size](https://img.shields.io/docker/image-size/solvaysphere/sentinel-dashboard/latest?color=green) ![Docker Version](https://img.shields.io/docker/v/solvaysphere/sentinel-dashboard/latest)

This project contains a Docker image meant to facilitate the deployment of [Sentinel Dashboard](https://github.com/alibaba/Sentinel/wiki/Dashboard).

[**中文**](README_ZH.md)

## Project directory

* build：Sentinel Dashboard makes the source code of the docker image
* env: Environment variable file for compose yaml
* example: Docker compose example for Nacos server


## Quick Start

```shell
docker run --name sentinel-dashboard-quick  -p 8080:8080 -d solvaysphere/sentinel-dashboard:1.8.2
```


## Advanced Usage

* Tips: You can change the version of the Sentinel Dashboard image in the compose file from the following configuration.
`example/.env`
```dotenv
SENTINEL_VERSION=1.8.2
```

Run the following command：

* Clone project

  ```powershell
  git clone --depth 1 https://github.com/solvaysphere/sentinel-dashboard-docker.git
  cd sentinel-dashboard-docker
  ```


* Standalone

  ```powershell
  docker-compose -f example/sentinel-dashboard.yaml up
  ```

* Open the Sentinel Dashboard console in your browser
  
  link：http://127.0.0.1:8080



## Common property configuration 

| name                                                | description                            | option                                 |
| --------------------------------------------------- | -------------------------------------- | -------------------------------------- |
| SERVER_PORT                                         | server port                            | default **8080**                 |
| CONTEXT_PATH                                        | context path                           | default **/**                    |
| SENTINEL_DASHBOARD_SESSION_TIMEOUT                  | session timeout                        | default **7200**                       |
| SENTINEL_DASHBOARD_COOKIE_NAME                      | cookie name                            | default **sentinel_dashboard_cookie**  |
| SENTINEL_AUTH_USERNAME                              | sentinel dashboard name                | default **sentinel**             |
| SENTINEL_AUTH_PASSWORD                              | Sentinel Dashboard password            | default **sentinel**             |
| SENTINEL_DASHBOARD_SERVER                           | Sentinel Dashboard Server Addr         | default 127.0.0.1:8080              |
| SENTINEL_DASHBOARD_PROJECT_NAME                     | project name                           | default sentinel-dashboard          |
| AUTH_ENABLED                                        | auth                                   | default true                        |
| SENTINEL_DASHBOARD_APP_HIDEAPPNOMACHINEMILLIS       | hideAppNoMachineMillis                 | default 0    min value: 60000  |
| SENTINEL_DASHBOARD_REMOVEAPPNOMACHINEMILLIS         | removeAppNoMachineMillis               | default 0     min value: 120000  |
| SENTINEL_DASHBOARD_UNHEALTHYMACHINEMILLIS           | unhealthyMachineMillis                 | default 60000     min value: 30000  |
| SENTINEL_DASHBOARD_AUTOREMOVEMACHINEMILLIS          | autoRemoveMachineMillis                | default 0     min value: 300000  |
| JVM_XMS                                             |  -Xms                                  | default :1g                            |
| JVM_XMX                                             |  -Xmx                                  | default :1g                            |
| JVM_XMN                                             |  -Xmn                                  | default :512m                          |
| JVM_MS                                              |  -XX:MetaspaceSize                     | default :128m                          |
| JVM_MMS                                             |  -XX:MaxMetaspaceSize                  | default :320m                          |
| SENTINEL_DEBUG                                      |  enable remote debug                   | y/n default :n                         |
| TOMCAT_ACCESSLOG_ENABLED                            | server.tomcat.accesslog.enabled        | default :false                         |
| SENTINEL_DASHBOARD_COOKIE                           |  cookie name setting                   | default :sentinel_dashboard_cookie     |

Reference example: [sentinel-dashboard.yaml](https://github.com/solvaysphere/sentinel-dashboard-docker/blob/master/example/sentinel-dashboard.yaml)


