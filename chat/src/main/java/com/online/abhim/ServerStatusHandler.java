package com.online.abhim;

import com.google.common.collect.Maps;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class ServerStatusHandler implements HttpHandler {
  private LongLoadHttpServer server;
  //  private final BlockingQueue queue = new LinkedBlockingDeque();
  private final ScheduledThreadPoolExecutor executor;
  private final ConcurrentMap<String, Value> parkedConnections = Maps.newConcurrentMap();


  public ServerStatusHandler(ScheduledThreadPoolExecutor executor) {
    this.executor = executor;
  }
//
//  public ServerStatusHandler(LongLoadHttpServer server) {
//    this.server = server;
//  }

  public void handle(HttpExchange exchange) throws IOException {
    Headers responseHeaders = exchange.getResponseHeaders();
    responseHeaders.set("Content-Type", "text/plain");
    exchange.sendResponseHeaders(200, 0);

    OutputStream responseBody = exchange.getResponseBody();
//    Headers requestHeaders = exchange.getRequestHeaders();

    for (Map.Entry<String, Value> entry : parkedConnections.entrySet()) {
      String parkInfo = entry.getKey() + "|" + entry.getValue().timeReaminingInSec() + "\n";
      responseBody.write(parkInfo.getBytes());
    }
//    Set<String> keySet = requestHeaders.keySet();
//    Iterator<String> iter = keySet.iterator();
//    while (iter.hasNext()) {
//      String key = iter.next();
//      List values = requestHeaders.get(key);
//      String s = key + " ss= " + values.toString() + "\n";
//      responseBody.write(s.getBytes());
//    }
    responseBody.close();
  }


  public boolean unparkConnection(String connId) throws IOException {
    Value value = parkedConnections.remove(connId);
    if (value != null) {
      value.future.cancel(true);
      HttpUtil.getResponseBody(value.exchange, HttpUtil.Type.KILLED);
      return true;
    }
    return false;
  }

  public void parkConnection(long time, TimeUnit unit, String conId, HttpExchange exchange) throws InterruptedException {
    Value value = new Value(conId, exchange, time, unit);
    Future future = executor.schedule(value.callable, time, unit);
    value.setFuture(future);
    parkedConnections.putIfAbsent(conId, value);
  }

  private class Value {
    final long timeout;
    final long parkTime = System.currentTimeMillis();
    final HttpExchange exchange;
    final Callable<Boolean> callable;
    Future future;

    public Value(final String conId, final HttpExchange exchange, long time, TimeUnit unit) {
      this.exchange = exchange;
      this.timeout = unit.toMillis(time);
      callable = new Callable<Boolean>() {
        public Boolean call() throws Exception {
          HttpUtil.getResponseBody(exchange, HttpUtil.Type.OK);
          return unparkConnection(conId);
        }
      };
    }

    public long timeReaminingInSec() {
      long diff = (parkTime + timeout) - System.currentTimeMillis();
      return TimeUnit.SECONDS.toSeconds(diff);
    }

    public void setFuture(Future future) {
      this.future = future;
    }
  }

}

