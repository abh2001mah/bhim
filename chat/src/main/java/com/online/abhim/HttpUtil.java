package com.online.abhim;

import com.google.common.collect.Maps;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class HttpUtil {
  public enum Type {OK, KILLED}

  public static Map<String, String> parseQuery(HttpExchange exchange) {
    String[] params = exchange.getRequestURI().getRawQuery().split("[&]");
    Map<String, String> keyValue = Maps.newHashMap();
    for (String param : params) {
      String[] kv = param.split("[=]");
      if (kv.length == 2) {
        keyValue.put(kv[0], kv[1]);
      }
    }
    return keyValue;
  }

  public static OutputStream getResponseBody(HttpExchange exchange, Type type) throws IOException {
    OutputStream responseBody = exchange.getResponseBody();
    Headers responseHeaders = exchange.getResponseHeaders();
    responseHeaders.set("Content-Type", "text/plain");
    exchange.sendResponseHeaders(200, 0);
    String response = "stat:"+type.name();
    responseBody.write(response.getBytes());
    responseBody.close();
    return responseBody;
  }
}
