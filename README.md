# NetReconnector
The script for linux to reconnect net.

1.put the script into the home dir, like: /home/pi

2. add x priority to the script
chmod +x NetReconnector.sh

3. add a task with crontab
crontab -e

# add this line, means run the script every 5 minutes between 8:00 and 22:00.
*/5 8-22 * * * ~/NetReconnector.sh 

4. log file generated in home dir, like: /home/pi/NetReconnector.log
