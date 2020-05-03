su root
wget http://archive.apache.org/dist/drill/drill-1.12.0/apache-drill-1.12.0.tar.gz
tar -xvf apache-drill-1.12.0.tar.gz
cd apache-drill-1.12.0
bin/drillbit.sh start -Ddrill.exec.http.port=8765
bin/drillbit.sh stop

