# contabo-autosnap
Simple bash script (**contabo-autosnap.sh**) to snapshot your Contabo VPS using Contabo API from cron in VM.
The script delete the oldest snapshot and create a new snapshot (daily=2).
<br/>
<br/>
![alt text](https://raw.githubusercontent.com/unix1984/contabo-autosnap/main/contabo_api_script.png)
<br/>
<br/>
<br/>
**Install (as root):**

```wget -O /usr/local/sbin/contabo-autosnap.sh https://raw.githubusercontent.com/unix1984/contabo-autosnap/main/contabo-autosnap.sh && chmod +x /usr/local/sbin/contabo-autosnap.sh```
<br/>
<br/>
<br/>
**cron (every day at 00:05):**

```5  0  * * *     root   /usr/local/sbin/contabo-autosnap.sh```
<br/>
<br/>
<br/>
