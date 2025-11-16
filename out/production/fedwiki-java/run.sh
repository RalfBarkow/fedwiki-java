#!/bin/sh
# usage: [DEBUG=1|2] sh run.sh [site]

if [ "$DEBUG" = "1" ]; then
  JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"
elif [ "$DEBUG" = "2" ]; then
  JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
else
  JAVA_OPTS=""
fi

java $JAVA_OPTS \
  -cp "jackson-core-2.14.2.jar:jackson-annotations-2.14.2.jar:jackson-databind-2.14.2.jar:." \
  Main "$1"
