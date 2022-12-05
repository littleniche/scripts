# Running out of space in root directory

**Check the size of logs inside the var directory by the following command:**

du -h /var/log

## Diminish the size of /var/log/journal
```
sudo journalctl --vacuum-size=100M
```
This will retain the most recent 100M of data.

```
sudo journalctl --vacuum-time=10d
```
This will retain only the last 10 days.
<hr/>

Also, open the /etc/systemd/journald.conf:

Uncomment the lines ***SystemMaxFileSize*** and ***SystemMaxUse.*** Do the following:
```
SystemMaxUse=100M
SystemMaxFileSize=100M
```

After editing, use ```service systemd-journald restart``` to activate the changed configuration. This removes the excess logs thus freeing up space.

- Clear page cache only :
```
sudo sh -c 'echo 1 >  /proc/sys/vm/drop_caches'
```
- Clear dendrites and inodes :
```
sudo sh -c 'echo 2 >  /proc/sys/vm/drop_caches' 
```
- Clear page cache, dendrites and inodes : 
```
sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches' 
```

- Clear all the log files (as root user)
```
find /var/log -type f -iname '*.log' -print0 | xargs -0 truncate -s0
```