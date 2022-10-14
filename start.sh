#!/usr/bin/env bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh

REPOSITORY=/home/ubuntu
cd $REPOSITORY
cd /build/libs

PROJECT_NAME=ChatWeb

#echo "> Build 파일 복사"
#echo "> cp $REPOSITORY/zip/*.jar $REPOSITORY/"
#
#cp $REPOSITORY/zip/*.jar $REPOSITORY/
#
#echo "> 새 어플리케이션 배포"
#JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'real.jar' | tail -n 1)
#JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME
#
#nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &

echo "> JAR Name: $JAR_NAME"

echo "> $JAR_NAME 에 실행권한 추가  "

chmod +x $JAR_NAME

echo "> $JAR_NAME 실행 "

IDLE_PROFILE=$(find_idle_profile)

echo "> $JAR_NAME 를 profile=$IDLE_PROFILE 로 실행합니다."
echo "> ========================== "
echo "> nohup java -jar -Dspring.profiles.active=$IDLE_PROFILE $JAR_NAME & "

nohup java -jar -Dspring.profiles.active=$IDLE_PROFILE $JAR_NAME &
#nohup java -jar \
#    -Dspring.config.location=classpath:/application.properties,classpath:/application-$IDLE_PROFILE.properties \
#    -Dspring.profiles.active=$IDLE_PROFILE \
#    $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &