#!/usr/bin/env python

import sys
import pika
import logging

routing_key = sys.argv[1] if len(sys.argv) > 1 else 'anonymous.info'
message = ' '.join(sys.argv[2:]) or "Hello World!"

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.CRITICAL)
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='topic_logs', type='topic')
channel.basic_publish(exchange='topic_logs',
                      routing_key=routing_key,
                      body=message)
print " [x] Sent %r: %r" % (routing_key, message)

connection.close()
