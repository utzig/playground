#!/usr/bin/env python

import pika
import sys

severities = sys.argv[1:]
if not severities:
    print >> sys.stderr, "Usage: %s [info] [warning] [error]" % (sys.argv[0],)
    sys.exit(1)

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

result = channel.queue_declare(exclusive=True)
queue_name = result.method.queue

for severity in severities:
    channel.queue_bind(exchange='direct_logs',
                       queue=queue_name,
                       routing_key=severity)

print ' [*] Waiting for messages. To exit press CTRL+C'
sys.stdout.flush()

def callback(ch, method, properties, body):
    print " [x] %r: %r" % (method.routing_key, body,)
    sys.stdout.flush()

channel.basic_consume(callback, queue=queue_name, no_ack=True)
channel.start_consuming()

connection.close()
