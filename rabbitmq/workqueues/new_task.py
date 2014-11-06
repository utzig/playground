#!/usr/bin/env python

import sys
import pika
import logging

message = ' '.join(sys.argv[1:]) or "Hello World!"

logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.CRITICAL)
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)
channel.basic_publish(exchange='',
                      routing_key='task_queue',
                      body=message,
                      properties=pika.BasicProperties(delivery_mode = 2))
print " [x] Sent %r" % (message,)

connection.close()
