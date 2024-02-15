# CVE-2021-23017 Nginx 0.6.18 - 1.20.0 Memory Overwrite Vulnerability Base Score: 7.7 HIGH
# How it work?
- The vulnerability is between the nginx server and the dns resolver.
- The resolver directive is needed to trigger the memory overflow.
- It trigger when the PoC run, and a victim connect to the server.
- this vulnerability is a Memory overwrite. The attacker can execute malicious code on the server, overwrite the arp list by arp poisoning, resulting in a MiTM.
![poc cve](https://github.com/ReturnRei/Snort_poc/assets/91879564/b05da170-cca2-46bd-a4d8-9d57fe4d6f8e)

# What is this repo ?
 - This github repo is a lab that contain all the resources to trigger the vulnerability, and setup snort rules to stop the attack.

# How to deploy the lab and execute the exploit ?
- ## Install Docker
- `git clone https://github.com/ReturnRei/Snort_poc`
- `git checkout -b {{your_super_branch_name}}`
- `docker compose build` \# Go get some coffee
- `docker compose up`

## Connect to terminals
- `docker exec -it [nginx | attacker | user] bash`

- ## In nginx, run:
- snort: `/home/snorty/snort3/bin/snort -c /home/snorty/snort3/etc/snort/snort.lua -R /home/snorty/ffs.rules -A alert_full -i eth0`
- - this command will allow you to setup snort, and the rules you import in it.

- Local PoC: `source runpoc.sh`
- - This command will run the vulnerability on local.
- ## in user, run:
This command will curl every second the server, and trigger the vulnerability on nginx server
- `./ucurl.sh`

## Rules
```
alert udp 0.0.0.0/24 any -> any 53 (msg:"Attempt to overflow buffer with common A pattern"; content:"|41 41 41 41 41 41 41 41 41 41|"; sid:100010;)
alert udp 0.0.0.0/24 any -> any 53 (msg:"Attempt to overflow buffer with common A pattern"; content:"|AAAAAAAAA|"; sid:100010;)
```
Why? Sending  AAAAA is common in memory corruption, it is a de facto standard everyone uses as seeing 0x41414141 is easy to see in memory.

## What you can do !
- Add new snort detection rules on the file ./nginx/ffs.rules
- Trigger the CVE directly from the attacker machine, with poc.py. It will make a MiTM !
- Create a MiTM and modify the page recieve by the victim.

