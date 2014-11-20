#!/usr/bin/env python

import pika as pk

conn = pk.BlockingConnection(pk.ConnectionParameters(host='localhost'))

ch = conn.channel()
ch.queue_declare(queue='rpc_queue')

def fib(n):
    if n == 0 or n == 1:
        return n
    else:
        total = 1
        for i in range(2, n+1):
            total *= i
        return total

def on_request(ch, method, props, body):
    n = int(body)

    print " [.] fib(%s)" % (n,)
    response = fib(n)

    ch.basic_publish(exchange='',
                     routing_key=props.reply_to,
                     properties=pk.BasicProperties(correlation_id=props.correlation_id),
                     body=str(response))
    ch.basic_ack(delivery_tag=method.delivery_tag)

ch.basic_qos(prefetch_count=1)
ch.basic_consume(on_request, queue='rpc_queue')

print " [x] Awaiting RPC requests"
ch.start_consuming()
