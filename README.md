# How to?

- Install Docker
- `git clone https://github.com/ReturnRei/Snort_poc`
- `git checkout -b {{your_super_branch_name}}`
- `docker compose build` \# Go get some coffee
- `docker compose up`

- Run terminals
- `docker exec -it [nginx | attacker | user] bash`

- In nginx, run: 
- - snort: `/home/snorty/snort3/bin/snort -c /home/snorty/snort3/etc/snort/snort.lua -R /home/snorty/ffs.rules -A alert_full -i eth0`
- - Local PoC: `source runpoc.sh`

## More
- Get a shell on the {{whatever}} container `docker exec -it nginx bash`

To do 
- Check snort works
- Snort rules for mitm, arp poisoning, shellcode with AAAAAAAA shellcode
- Does the poc even work? Corrupt memory? PROOF  

