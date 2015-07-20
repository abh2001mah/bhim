package com.online.abhim;

/**
 * Created by abhishekmaheshwari on 21/07/15.
 */
public interface Cache<K,V> {

  public void put(K key, V value);
  public V get(K key);
}
