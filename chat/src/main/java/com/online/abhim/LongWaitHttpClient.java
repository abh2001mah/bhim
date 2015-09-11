package com.online.abhim;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by abhishekmaheshwari on 01/08/15.
 */
public class LongWaitHttpClient {
  public static void main(String[] args) throws Exception {
    LongWaitHttpClient http = new LongWaitHttpClient();

    System.out.println("Testing 1 - Send Http GET request");
    http.sendGet();

    System.out.println("\nTesting 2 - Send Http POST request");
    http.sendPost();

  }

  // HTTP GET request
  private void sendGet() throws Exception {
    HttpURLConnection con = getHttpURLConnection();

    // optional default is GET
    con.setRequestMethod("GET");

    int responseCode = con.getResponseCode();
    System.out.println("Response Code : " + responseCode);

    BufferedReader in = new BufferedReader(
      new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();

    while ((inputLine = in.readLine()) != null) {
      response.append(inputLine);
    }
    in.close();

    //print result
    System.out.println(response.toString());

  }

  private HttpURLConnection getHttpURLConnection() throws Exception {
    String url = "http://localhost:8080/";
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
    return con;
  }

  // HTTP POST request
  private void sendPost() throws Exception {

    HttpURLConnection con = getHttpURLConnection();

    //add reuqest header
    con.setRequestMethod("POST");

    String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";

    // Send post request
    con.setDoOutput(true);
    DataOutputStream wr = new DataOutputStream(con.getOutputStream());
    wr.writeBytes(urlParameters);
    wr.flush();
    wr.close();

    int responseCode = con.getResponseCode();
    System.out.println("Post parameters : " + urlParameters);
    System.out.println("Response Code : " + responseCode);

    BufferedReader in = new BufferedReader(
      new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();

    while ((inputLine = in.readLine()) != null) {
      response.append(inputLine);
    }
    in.close();

    //print result
    System.out.println(response.toString());

  }

}
