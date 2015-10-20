package com.sample.abhim;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
//This solution is given by Abhishek Maheshwari (abhim.m@gmail.com) for Sumologic conding exercise
public class AddressCacheTest {
	private AddressCache cache;
	private ArrayList<InetAddress> addresses;
	private boolean populated = false;
	
	@Before
	public void setUp() throws UnknownHostException {
		cache = new AddressCache(10, TimeUnit.SECONDS);
		if(!populated) {
			addresses = prepareAddresses();	
		}
	}
	
	@After
	public void tearDown() {
//		addresses.clear();
		cache = null;
	}
	
	private ArrayList<InetAddress> prepareAddresses() throws UnknownHostException {
		ArrayList<InetAddress> list = new ArrayList<InetAddress>();
		list.add(InetAddress.getByName("127.0.0.1"));
		list.add(InetAddress.getByName("google.com"));
		list.add(InetAddress.getByName("google.co.in"));
		list.add(InetAddress.getByName("gmail.com"));
		list.add(InetAddress.getByName("oracle.com"));
		list.add(InetAddress.getLocalHost());
		populated = true;
		return list;
	}
	
	@Test(expected=IllegalStateException.class)
	public void testValidAddressCache() {
		cache = new AddressCache(-1, TimeUnit.SECONDS);
	}
	
	@Test
	public void testAdd() throws UnknownHostException {
		cache.add(InetAddress.getLocalHost());
		Assert.assertFalse(cache.add(InetAddress.getLocalHost()));
	}
	
	@Test
	public void testRemove() throws UnknownHostException {
//		System.out.println(InetAddress.getByName("127.0.0.1").equals(InetAddress.getLocalHost()));
//		System.out.println(InetAddress.getLocalHost().equals(InetAddress.getLocalHost()));
//		System.out.println(InetAddress.getByName("google.com").equals(InetAddress.getByName("gmail.com")));
		cache.add(InetAddress.getLocalHost());
		Assert.assertTrue(cache.remove(InetAddress.getLocalHost()));
		Assert.assertTrue(cache.add(InetAddress.getLocalHost()));
	}
	
	@Test
	public void testPeek() throws UnknownHostException {
		for(InetAddress address : addresses) {
			cache.add(address);
		}
		Assert.assertTrue(cache.peek().equals(InetAddress.getLocalHost()));
		// try peek one more 
		Assert.assertTrue(cache.peek().equals(InetAddress.getLocalHost()));
	}
	
	@Test
	public void testPeekWithSleep() throws InterruptedException {
		for(InetAddress address : addresses) {
			cache.add(address);
		}
		TimeUnit.SECONDS.sleep(12L);
		Assert.assertNull(cache.peek());
	}
	
	@Test
	public void testTake() throws UnknownHostException {
		for(InetAddress address : addresses) {
			cache.add(address);
		}
		int size = addresses.size();
//		System.out.println(size);
		while(size > 0) {
			Assert.assertTrue(cache.take().equals(addresses.get(--size)));	
		}
	}
	
	@Test
	public void testTakeWithSleep() throws UnknownHostException, InterruptedException {
		final InetAddress newAddress = InetAddress.getByName("microsoft.com");
		for(InetAddress address : addresses) {
			cache.add(address);
		}
		// sleeping for 12 sec, all addresses will be removed on take call
		TimeUnit.SECONDS.sleep(12L);
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				cache.add(newAddress);
			}
		}, TimeUnit.SECONDS.toMillis(5));
		
		//now assert that take retunrs newly added address
		long start = System.nanoTime();
		Assert.assertTrue(cache.take().equals(newAddress));
		long end = System.nanoTime();
		Assert.assertTrue("diff in time is "+(end-start), (end-start)>=5);
	}
}
