package com.sample.abhim;

import java.net.InetAddress;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/*
 * The AddressCache has a max age for the elements it's storing, an add method 
 * for adding elements, a remove method for removing, a peek method which 
 * returns the most recently added element, and a take method which removes 
 * and returns the most recently added element.
 */
//This solution is given by Abhishek Maheshwari (abhim.m@gmail.com) for Sumologic conding exercise
public class AddressCache {
	private final long maxAgeInNanoSec;
	private final Set<MyCustomKey> set;
	private final Lock lock;
	private final Condition notEmpty;
	
	public AddressCache(long maxAge, TimeUnit unit) {
		if(maxAge <= 0) {
			throw new IllegalStateException("AddressCache can not be created with "+maxAge+" age.");
		}
		maxAgeInNanoSec = unit.toNanos(maxAge);
		set = new TreeSet<AddressCache.MyCustomKey>();
		lock = new ReentrantLock();
		notEmpty = lock.newCondition();
	}
	
	private MyCustomKey getCustomKey(InetAddress address) {
		return new MyCustomKey(address, Long.valueOf(System.nanoTime()));
	}
	
//	private MyCustomKey getSimpleCustomKey(InetAddress address) {
//		return new MyCustomKey(address,null);
//	}
	
	/**
	 * add() method must store unique elements only (existing elements must be ignored). 
	 * This will return true if the element was successfully added. 
	 * @param address
	 * @return
	 */

	public boolean add(InetAddress address) {
		if(address == null) {
			throw new IllegalStateException("null values are not accetable for AddressCache");
		}
		lock.lock();
		try {
			boolean ret = set.add(getCustomKey(address));
			if(ret) {
				notEmpty.signalAll();
			}
			return ret;
		} finally {
			lock.unlock();
		}
	}

	/**
	 * remove() method will return true if the address was successfully removed
	 * @param address
	 * @return
	 */
	public boolean remove(InetAddress address) {
		lock.lock();
		try {
			return set.remove(getCustomKey(address));	
		} finally {
			lock.unlock();
		}
	}

	/**
	 * The peek() method will return the most recently added element, 
	 * null if no element exists.
	 * @return
	 */
	public InetAddress peek() {
		lock.lock();
		try {
			Iterator<MyCustomKey> itr = set.iterator();
			while(itr.hasNext()) {
				MyCustomKey entry = itr.next();
				long currentTime = System.nanoTime();
				long addTime = entry.getCreateTime();
				if((currentTime - addTime) >= maxAgeInNanoSec) {
					itr.remove();
				} else {
					return entry.getAddress();
				}
			}	
		} finally {
			lock.unlock();
		}
		return null;
	}

	/**
	 * take() method retrieves and removes the most recently added element 
	 * from the cache and waits if necessary until an element becomes available.
	 * @return
	 */
	
	//I did not like this method signature but I am not sure that I am allowed to change 
	// but I would have added throws InterruptedException (in signature of this method) 
	public InetAddress take() {
		lock.lock();
		try {
			InetAddress element = peek();
			while(element==null) {
				waitOnCondition();
				element = peek();
			}
			remove(element);
			return element;
		} finally {
			lock.unlock();
		}
	}
	
	private void waitOnCondition() {
		try {
			notEmpty.await();
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}
	
	private static class MyCustomKey implements Comparable<MyCustomKey> {
		private final InetAddress address;
		private final Long createTime;
		
		public MyCustomKey(InetAddress address, Long createTime) {
			this.createTime = createTime;
			this.address = address;
		}
		
		public Long getCreateTime() {
			return createTime;
		}
		
		public InetAddress getAddress() {
			return address;
		}
 
		//This have a change to overflow but very rare where difference between two longs are not able to fit int range 
		//(example Long.MAX - LONG.MIX)
		public int compareTo(MyCustomKey o) {
			return this.address.equals(o.address) ? 0 : (int)(o.createTime.longValue() - this.createTime.longValue());
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result
					+ ((address == null) ? 0 : address.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			MyCustomKey other = (MyCustomKey) obj;
			if (address == null) {
				if (other.address != null)
					return false;
			} else if (!address.equals(other.address))
				return false;
			return true;
		}
		
		
	}
	
}
