package com.online.abhim;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class PostHandler implements HttpHandler {
  private enum ACTION_CODE {CORRECT, CONID_MINSSING}
  private static final String CONNID = "connid";

  private final ServerStatusHandler serverStatusHandler;

  public PostHandler(ServerStatusHandler serverStatusHandler) {
    this.serverStatusHandler = serverStatusHandler;
  }

  public void handle(HttpExchange exchange) throws IOException {
    Headers responseHeaders = exchange.getResponseHeaders();
    responseHeaders.set("Content-Type", "text/plain");
    exchange.sendResponseHeaders(200, 0);
    Map<String, String> keyValues = HttpUtil.parseQuery(exchange);
    ACTION_CODE actionCode = getActionCode(keyValues);
    try {
      killConnection(actionCode, keyValues, exchange);
    } catch (InterruptedException e) {

    }
  }


  private ACTION_CODE getActionCode(Map<String, String> keyValues) {
    String conId = keyValues.get(CONNID);
    if (conId == null) {
      return ACTION_CODE.CONID_MINSSING;
    }
    return ACTION_CODE.CORRECT;
  }

  private void killConnection(ACTION_CODE actionCode, Map<String, String> keyValues, HttpExchange exchange) throws InterruptedException, IOException {
    OutputStream responseBody = exchange.getResponseBody();
    switch (actionCode) {
      case CORRECT:
        String conId = keyValues.get(CONNID);
        serverStatusHandler.unparkConnection(conId);
        HttpUtil.getResponseBody(exchange, HttpUtil.Type.OK);
        break;
      case CONID_MINSSING:
        break;
      default:
        throw new RuntimeException("ACTION_CODE " + actionCode + " is not valid");
    }
  }
}


//    Set<String> keySet = requestHeaders.keySet();
//    Iterator<String> iter = keySet.iterator();
//    while (iter.hasNext()) {
//      String key = iter.next();
//      List values = requestHeaders.get(key);
//      String s = key + " abhim = " + values.toString() + "\n";
//      responseBody.write(s.getBytes());
//    }
