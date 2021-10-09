#!/bin/bash
# Copyright 1999-2018 Alibaba Group Holding Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -x
export SENTINEL_SEARCH_NAMES="application"
export SENTINEL_SEARCH_LOCATIONS=file:${BASE_DIR}/conf/
#===========================================================================================
# JVM Configuration
#===========================================================================================
JAVA_OPT="${JAVA_OPT} -server -Xms${JVM_XMS} -Xmx${JVM_XMX} -Xmn${JVM_XMN} -XX:MetaspaceSize=${JVM_MS} -XX:MaxMetaspaceSize=${JVM_MMS}"
if [[ "${SENTINEL_DEBUG}" == "y" ]]; then
  JAVA_OPT="${JAVA_OPT} -Xdebug -Xrunjdwp:transport=dt_socket,address=9555,server=y,suspend=n"
fi
JAVA_OPT="${JAVA_OPT} -XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${BASE_DIR}/logs/java_heapdump.hprof"
JAVA_OPT="${JAVA_OPT} -XX:-UseLargePages"

#===========================================================================================
# Setting system properties
#===========================================================================================
if [[ ! -z "${PREFERRED_NETWORKS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dnacos.inetutils.preferred-networks=${PREFERRED_NETWORKS}"
fi

if [[ ! -z "${IGNORED_INTERFACES}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dnacos.inetutils.ignored-interfaces=${IGNORED_INTERFACES}"
fi

if [[ ! -z "${SERVER_PORT}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.port=${SERVER_PORT}"
fi

if [[ ! -z "${CONTEXT_PATH}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.servlet.context-path=${CONTEXT_PATH}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_SESSION_TIMEOUT}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.servlet.session.timeout=${SENTINEL_DASHBOARD_SESSION_TIMEOUT}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_COOKIE_NAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.servlet.session.cookie.name=${SENTINEL_DASHBOARD_COOKIE_NAME}"
fi

if [[ ! -z "${SENTINEL_AUTH_USERNAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.auth.username=${SENTINEL_AUTH_USERNAME}"
fi

if [[ ! -z "${SENTINEL_AUTH_PASSWORD}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.auth.password=${SENTINEL_AUTH_PASSWORD}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_SERVER}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dcsp.sentinel.dashboard.server=${SENTINEL_DASHBOARD_SERVER}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_PROJECT_NAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dproject.name=${SENTINEL_DASHBOARD_PROJECT_NAME}"
fi

if [[ ! -z "${AUTH_ENABLED}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dauth.enabled=${AUTH_ENABLED}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_APP_HIDEAPPNOMACHINEMILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.app.hideAppNoMachineMillis=${SENTINEL_DASHBOARD_APP_HIDEAPPNOMACHINEMILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_REMOVEAPPNOMACHINEMILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.removeAppNoMachineMillis=${SENTINEL_DASHBOARD_REMOVEAPPNOMACHINEMILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_UNHEALTHYMACHINEMILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.unhealthyMachineMillis=${SENTINEL_DASHBOARD_UNHEALTHYMACHINEMILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_AUTOREMOVEMACHINEMILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.autoRemoveMachineMillis=${SENTINEL_DASHBOARD_AUTOREMOVEMACHINEMILLIS}"
fi

JAVA_OPT="${JAVA_OPT} -jar ${BASE_DIR}/sentinel-dashboard.jar"
JAVA_OPT="${JAVA_OPT} ${JAVA_OPT_EXT}"
JAVA_OPT="${JAVA_OPT} --spring.config.additional-location=${SENTINEL_SEARCH_LOCATIONS}"
JAVA_OPT="${JAVA_OPT} --spring.config.name=${SENTINEL_SEARCH_NAMES}"
JAVA_OPT="${JAVA_OPT} --server.max-http-header-size=524288"

echo "Nacos is starting, you can docker logs your container"
exec $JAVA ${JAVA_OPT}
