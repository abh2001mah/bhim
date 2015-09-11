package com.online.abhim;

import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class LongLoadHttpServer {

  public static void main(String[] args) throws IOException {
    LongLoadHttpServer llhs = new LongLoadHttpServer();
    llhs.startServer();
  }

  public void startServer() throws IOException {
    InetSocketAddress address = new InetSocketAddress(8080);
    ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(10);
    ServerStatusHandler ssHandler = new ServerStatusHandler(executor);
    HttpServer server = HttpServer.create(address, 0);
    server.createContext("/GET/sleep", new GetHandler(ssHandler));
    server.createContext("/POST/kill", new PostHandler(ssHandler));
    server.createContext("/GET/server-status", ssHandler);
    server.setExecutor(executor);
    server.start();
    System.out.println("Server is listening on port 8080");
  }
}
