#!/usr/bin/env python

import sys
import pika
import logging

message = ' '.join(sys.argv[1:]) or "info: Hello World!"

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.CRITICAL)
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs', type='fanout')
channel.basic_publish(exchange='logs', routing_key='', body=message)
print " [x] Sent %r" % (message,)

connection.close()
