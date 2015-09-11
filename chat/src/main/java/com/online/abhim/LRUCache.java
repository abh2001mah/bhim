package com.online.abhim;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Created by abhishekmaheshwari on 21/07/15.
 */

/**
 * This class implements LRU cache based on LinkedHashMap.
 * @param <K>
 * @param <V>
 */
public class LRUCache<K,V> implements Cache<K,V> {
  private final LinkedHashMap<K,V> cache;
  private final Lock writeLock;

  public LRUCache(final int maxEntries) {
    ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
    this.writeLock = readWriteLock.writeLock();
    //access-order true to preserve access order (put/putAll/get only)
    this.cache = new LinkedHashMap<K, V>(maxEntries, 0.75f, true) {
      @Override
      protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
        return size() > maxEntries;
      }
    };
  }

  public void put(K key, V value) {
    writeLock.lock();
    try {
      cache.put(key,value);
    } finally {
      writeLock.unlock();
    }
  }

  // Using writeLock because LinkedHashMap.get() modifies its internal state and we can't have two threads modifying internal state parallely
  public V get(K key) {
    writeLock.lock();
    try {
      return cache.get(key);
    } finally {
      writeLock.unlock();
    }
  }
}


// 1. we can also use org.apache.commons.collections.map.LRUMap to achieve the same. LRUMap is not a thread-safe implementation so we should use locks (just like in this implementation) to make it concurrent.

//2. we can also build com.google.common.cache.Cache from com.google.common.cache.CacheBuilder.newBuilder().maximumSize(maxEntries).build(). This implementation is thread-safe.
