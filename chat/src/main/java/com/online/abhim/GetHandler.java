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
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class GetHandler implements HttpHandler {
//  private final LongLoadHttpServer server;
  private final ServerStatusHandler serverStatusHandler;
//  private final ScheduledThreadPoolExecutor executor;
  private long parkTime;
//  private long timeOut;
  private static final String TIMEOUT = "timeout";
  private static final String CONNID = "connid";

  private enum ACTION_CODE {CORRECT, TIMEOUT_MISSING, CONID_MINSSING}

  public GetHandler(ServerStatusHandler serverStatusHandler) {
//    this.server = server;
    this.serverStatusHandler = serverStatusHandler;
//    this.executor = executor;
  }

  public void handle(HttpExchange exchange) throws IOException {
//    OutputStream responseBody = exchange.getResponseBody();
//    Headers responseHeaders = exchange.getResponseHeaders();
//    responseHeaders.set("Content-Type", "text/plain");
//    exchange.sendResponseHeaders(200, 0);
//    OutputStream responseBody = exchange.getResponseBody();
    Map<String, String> keyValues = HttpUtil.parseQuery(exchange);
    ACTION_CODE actionCode = getActionCode(keyValues);
    try {
      parkConnection(actionCode, keyValues, exchange);
    } catch (InterruptedException e) {

    }
  }

  private ACTION_CODE getActionCode(Map<String, String> keyValues) {
    String timeoutInSec = keyValues.get(TIMEOUT);
    if (timeoutInSec == null) {
      return ACTION_CODE.TIMEOUT_MISSING;
    }

    String conId = keyValues.get(CONNID);
    if (conId == null) {
      return ACTION_CODE.CONID_MINSSING;
    }

    return ACTION_CODE.CORRECT;
  }

  private void parkConnection(ACTION_CODE actionCode, Map<String, String> keyValues, HttpExchange exchange) throws InterruptedException {
    switch (actionCode) {
      case CORRECT:
        long timeInSec = Long.parseLong(keyValues.get(TIMEOUT));
        String conId = keyValues.get(CONNID);
        serverStatusHandler.parkConnection(timeInSec, TimeUnit.SECONDS, conId, exchange);
        break;
      case TIMEOUT_MISSING:
        break;
      case CONID_MINSSING:
        break;
      default:
        throw new RuntimeException("ACTION_CODE " + actionCode + " is not valid");
    }
  }

}
