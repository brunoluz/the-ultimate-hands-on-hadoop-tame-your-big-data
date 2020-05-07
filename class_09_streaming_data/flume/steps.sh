wget media.sundog-soft.com/hadoop/example.conf

# workaround for flume agent log problem
cd /var/log/flume
su root
touch flume.log
chown maria_dev:maria_dev flume.log
exit

cd /usr/hdp/current/flume-server/
bin/flume-ng agent --conf conf --conf-file ~/example.conf --name a1 -Dflume.root.logger=INFO,console

# on another session
telnet localhost 44444

# on another session
tail -f /var/log/flume/flume.log

# exercise 2
cd ~/
wget http://media.sundog-soft.com/hadoop/flumelogs.conf
mkdir spool

cd /usr/hdp/current/flume-server/
bin/flume-ng agent --conf conf --conf-file ~/flumelogs.conf --name a1 -Dflume.root.logger=INFO,console
cp access_log_small.txt spool/fred.txt
cd spool
ll # check that the name is now with COMPLETED
