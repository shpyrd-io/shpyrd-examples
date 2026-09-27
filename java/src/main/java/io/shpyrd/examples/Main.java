package io.shpyrd.examples;

import com.sun.net.httpserver.HttpServer;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;

/** A Java HTTP server with no framework: the Java buildpack builds the jar with Maven and runs it. */
public class Main {
  public static void main(String[] args) throws Exception {
    int port = Integer.parseInt(System.getenv().getOrDefault("PORT", "8080"));
    HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
    server.createContext("/", exchange -> {
      String who = exchange.getRequestHeaders().getFirst("X-Shpyrd-User");
      if (who == null) who = "anonymous visitor";
      String body = "<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\"><title>example-java</title>"
          + "<style>body{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}code{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}</style></head>"
          + "<body><h1>Java " + Runtime.version().feature() + " on shpyrd</h1><p>Hello, <code>" + who + "</code>.</p>"
          + "<p>Project <code>" + System.getenv("SHPYRD_PROJECT") + "</code>, workspace <code>" + System.getenv("SHPYRD_WORKSPACE") + "</code>.</p></body></html>";
      byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
      exchange.getResponseHeaders().add("Content-Type", "text/html; charset=utf-8");
      exchange.sendResponseHeaders(200, bytes.length);
      try (OutputStream out = exchange.getResponseBody()) { out.write(bytes); }
    });
    server.start();
    System.out.println("listening on :" + port);
  }
}
