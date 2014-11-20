#!/usr/bin/env python

import pika as pk
import sys
import uuid

class FibonacciRpcClient(object):
    def __init__(self):
        self.conn = pk.BlockingConnection(pk.ConnectionParameters(host='localhost'))

        self.ch = self.conn.channel()

        result = self.ch.queue_declare(exclusive=True)
        self.callback_queue = result.method.queue

        self.ch.basic_consume(self.on_response, no_ack=True, queue=self.callback_queue)

    def on_response(self, ch, method, props, body):
        if self.corr_id == props.correlation_id:
            self.response = body

    def call(self, n):
        self.response = None
        self.corr_id = str(uuid.uuid4())
        self.ch.basic_publish(exchange='',
                              routing_key='rpc_queue',
                              properties=pk.BasicProperties(reply_to=self.callback_queue,
                                                            correlation_id=self.corr_id),
                              body=str(n))
        while self.response is None:
            self.conn.process_data_events()
        return int(self.response)

fibonacci_rpc = FibonacciRpcClient()

if len(sys.argv) < 2:
    print >> sys.stderr, "Usage: %s value..." % (sys.argv[0],)
    sys.exit(1)

n = int(sys.argv[1])
print " [x] Requesting fib(%r)" % (n,)
response = fibonacci_rpc.call(n)
print " [.] Got %r" % (response,)
