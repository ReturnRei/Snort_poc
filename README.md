# CVE-2021-23017 Nginx 0.6.18 - 1.20.0 Memory Overwrite Vulnerability Base Score: 7.7 HIGH
# How it work?
- The vulnerability is betwin the nginx server and the dns resolver.
- It trigger when the PoC run, and a victim connect to the server.
- this vulnerability is a Memory overwrite. The attacker can execute malicious code on the server, overwrite the arp list by arp poisoning, resulting in a MiTM.
![poc cve](https://github.com/ReturnRei/Snort_poc/assets/91879564/b05da170-cca2-46bd-a4d8-9d57fe4d6f8e)

# What is this repo ? 
 - This github repo is a lab that contain all the resources to trigger the vulnerability, and setup snort rules to stop the attack.

# How to deploy the lab ?
- ## Install Docker
- 
- `git clone https://github.com/ReturnRei/Snort_poc`
- `git checkout -b {{your_super_branch_name}}`
- `docker compose build` \# Go get some coffee
- `docker compose up`

- ## Run terminals
- `docker exec -it [nginx | attacker | user] bash`

- ## In nginx, run: 
- - snort: `/home/snorty/snort3/bin/snort -c /home/snorty/snort3/etc/snort/snort.lua -R /home/snorty/ffs.rules -A alert_full -i eth0`
- - Local PoC: `source runpoc.sh`

- ## in user, run:
- - `.\ucurl.sh`

# Vuln proof:
url


## More
- Get a shell on the {{whatever}} container `docker exec -it nginx bash`

To do 
- Check snort works
- Snort rules for mitm, arp poisoning, shellcode with AAAAAAAA shellcode
- Does the poc even work? Corrupt memory? PROOF  




