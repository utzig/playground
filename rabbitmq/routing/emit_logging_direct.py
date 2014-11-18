#!/usr/bin/env python

import sys
import pika
import logging

severity = sys.argv[1] if len(sys.argv) > 1 else 'info'
message = ' '.join(sys.argv[2:]) or "Hello World!"

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.CRITICAL)
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='direct_logs', type='direct')
channel.basic_publish(exchange='direct_logs',
                      routing_key=severity,
                      body=message)
print " [x] Sent %r: %r" % (severity, message)

connection.close()
