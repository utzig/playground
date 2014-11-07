#!/usr/bin/env python

import pika

def callback(ch, method, properties, body):
    print " [x] %r" % (body,)

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

result = channel.queue_declare(exclusive=True)
queue_name = result.method.queue

channel.queue_bind(exchange='logs', queue=queue_name)
print ' [*] Waiting for messages. To exit press CTRL+C'
channel.basic_consume(callback, queue=queue_name, no_ack=True)
channel.start_consuming()

connection.close()
