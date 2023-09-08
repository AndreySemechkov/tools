#!/bin/bash

# Expects at $1 arg the path to a config file

source $1
echo $1
cd $BACKUPDIR

echo "Backup dir: $BACKUPDIR "

while :
do
LASTFILE=$(ls -1 -X $BACKUPDIR | tail -1)
num_files=$(ls $BACKUPDIR | wc -l)

if [ $num_files -eq 0 ]; then
    echo "Starting from binlog file $STARTFILE"
	LASTFILE=$STARTFILE
else
	echo "Repeating back up of last binlog file $LASTFILE to continue"
	echo "rm $BACKUPDIR/$LASTFILE"
        rm -f $BACKUPDIR/$LASTFILE
fi
echo "Starting live binlog backup command:"
echo "MBL --raw --read-from-remote-server --stop-never --host $MYSQLHOST --port $MYSQLPORT -u $MYSQLUSER -pMYSQLPASS $LASTFILE"
$MBL --raw --read-from-remote-server --stop-never --host $MYSQLHOST --port $MYSQLPORT -u $MYSQLUSER -p$MYSQLPASS $LASTFILE

echo "mysqlbinlog exited with $? trying to reconnect in $RESPAWN seconds, expo backoff."

sleep $RESPAWN
(( RESPAWN*=2 ))
done