### 1. To check service status (running or not)
`systemctl status udev` can be any service which is installed eg apache2, sshd etc.

**`systemctl status udev | awk 'NR==5' | awk -F : '{print $2}' | awk '{print $1}'`**

`awk 'NR==5'` NR --> Number of Record --> line number 5 (where active is written)
<br>`Active: active (running) since Sat 2026-01-03...`<br>
<br>`awk -F : '{print $2}'` -F --> field seperator  $2 -->posional variable
            <br>`active (running) since Sat 2026-01-03...`<br>
<br>`awk '{print $1}'`  To display only first column
                            <br>`active`

### 2. Another way (of status checking active or inactive)

**`systemctl is-active udev`**

### 3. Status checking via if statement (services_Stats)
      -Inmailer configuration --> generating app password in gmail

### 4. Checking service using ps command  (important for 3rd party services)

**`ps -ax  | grep apache2  | grep -v grep`**

`ps -ax` --> Process Status list  a --> lists all processes  x --> includes invisible processes runing in background.
<br>Result: A massive list of every single program running on your computer.<br>
<br>`grep apache2` grep --> search tool (will only display lines conataing word apache2)<br>
<br>`grep -v grep` invert match --> show every line accept the ones containing word grep in it.

### 5. Process Status if statment (service_ps.sh)

**`ps -ax  | grep apache2  | grep -v grep   | wc -l`**

`wc -l`  wc --> word count   --> -l count lines 

### 6. Disk status [Partions] (disk_status.sh)

**`df -h  | grep /dev/mapper/ubuntu--vg-ubuntu--lv | awk '{print $5}' | tr '%' ' '`**

`df -h`  df --> disk free  --> -h human readable (converts bytes in MBs, GBs etc)<br>
`grep copy/paste any filesystem name` specific filter<br>
`awk '{print $5}'`  --> Displays 5th column<br>
`tr '%' ' '`  --> translate command  --> replaces % sign with space<br>

`df -h  | awk 'NR>1'` --> No. of Records (line No.)  `NR>1` --> only print lines greater than 1<br>
`df -h  | awk 'NR!=1'`  Same as above<br>
`df -h  | tail -n +2`   Same as above --> tail is fpr end of file --> start from line 2 skipping header<br>
Removes this header --->  Filesystem      Size  Used Avail Use% Mounted on<br>

`df -h  | awk 'NR>1' | sed s/%//g` sed --> Stream Editor  s --> substitute --> global (for multiple % signs)    ---> it substitutes all the % sign with nothing <br>
`df -h  | awk 'NR>1' | sed s/%//g | awk '{ print $5}'`  --> only print all rows of 5th column

**`df -h  | awk 'NR>1' | sed s/%//g | awk '{ if ($5 > 50 ) print $0}'`** --> only print rows having value greater than 50 in 5th column without % sign
`$0` represents the entire line (i.e. if the condition is met, it prints the whole row so you can see which disk is filling up).

### 7. Copying (cp)

**`cp -vrf /var/log/auth.log .`**   `cp` --> copy command<br>
`-v` --> verbose --> result --> `'/var/log/auth.log' -> './auth.log'`<br>
`r` (recursive)  --> ensure everything (dir/content) inside a target gets copied.<br>
`f` (force) --> overwrites destination file (if already) exists without asking permission<br>
`/var/log/auth.log` --> path of file to be copied<br>
`.` --> current working directory<br>

### 8. Auth.Log (disk_log.sh)

**`du -sh auth.log`**

`du` --> Disk Usage Unlike `df` (which looks at the whole disk), `du` looks at specific files or folders.<br>
`-s` Summary --> only display total size & discards any extra sub-information<br>
`h` Human-readable --> coverts bytes into gb, mb or kb<br>
`auth.log` --> file you need to measure<br>

**`tar -xvf auth.log---`** Tape ARchive --> create/extract archives & list contents of archives.



