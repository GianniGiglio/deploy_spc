#!/bin/bash
for SERVICE in 'servicemix' 'cassandra' 'postgresql' 'sonarqube'
  do
      if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
          echo "$SERVICE is already running..."
      else
        if [ $SERVICE = 'servicemix' ];
          then
            echo "Starting init script Servicemix..."
            sudo /etc/init.d/servicemix start
        else
          if [ $SERVICE = 'cassandra' ];
            then
              echo "No cassandra needed..."
            else
              if [ $SERVICE = 'postgresql' ];
                then
                echo "Starting postgres server..."
                sudo service postgresql start
              else
                if [ $SERVICE = 'sonarqube' ];
                  then
                  echo "Starting sonar server..."
                  sudo /etc/init.d/sonar start
                fi
              fi
            fi
        fi
      fi
  done
