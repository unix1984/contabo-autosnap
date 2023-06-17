# contabo-autosnap
Simple bash script to snapshot your Contabo VPS using Contabo API from cron in VM.
The script delete the oldest snapshot and create a new snapshot (daily=2).
<br/>
<br/>
<br/>
**Install:**

```wget -O /usr/local/sbin/contabo-autosnap.sh https://raw.githubusercontent.com/unix1984/contabo-autosnap/main/contabo-autosnap.sh && chmod +x /usr/local/sbin/contabo-autosnap.sh```
<br/>
<br/>
<br/>
**cron:**

```5  0  * * *     root   /usr/local/sbin/contabo-autosnap.sh```
<br/>
<br/>
<br/>
