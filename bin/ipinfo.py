#!/usr/bin/env python
import os
import sys
import urllib2
from optparse import OptionParser

parser = OptionParser()
parser.add_option("-i", "--ip-address", dest="ip_address",
                  help="don't lookup IP address, use this instead")
parser.add_option("-r", "--reverse-ip", dest="reverse_ip", action="store_true",
                  help="include Reverse IP lookup")
parser.add_option("-b", "--bgp-origin-asn", dest="bgp_origin_asn", action="store_true",
                  help="include BGP Origin ASN information")
parser.add_option("-d", "--as-description", dest="as_description", action="store_true",
                  help="include AS description")
(options, args) = parser.parse_args()

def reverse_ip(ip_address):
    quad = ip_address.split('.')
    return '.'.join(reversed(quad))

if options.ip_address:
    ip_address = options.ip_address
else:
    ip_address = urllib2.urlopen('http://api.externalip.net/ip/').read()

reverse_ip_address = reverse_ip(ip_address)

print ip_address

if options.reverse_ip == True:
    os.system("dig +noall +answer @4.2.2.2 -x %s" % (ip_address))

if options.bgp_origin_asn == True:
    os.system("dig +short %s.origin.asn.cymru.com TXT" % (reverse_ip_address))

if options.as_description == True:
    # get the bgp origin asns, do a lookup for each
    pass
