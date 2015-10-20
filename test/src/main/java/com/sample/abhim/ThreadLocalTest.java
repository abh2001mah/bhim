package com.sample.abhim;
public class ThreadLocalTest {
	
	public static void main(String[] args) {
		ThreadLocalTest tlTest = new ThreadLocalTest();
		tlTest.testThreadLocal();
	}
	
	public void testThreadLocal() {
		final ThreadLocalContainer container = new ThreadLocalContainer(); 
		Thread thread1 = new Thread() {
			@Override
			public void run() {
				container.createThreadLocal();
				container.accessThreadLocal();
			}
		};
		
		Thread thread2 = new Thread() {
			@Override
			public void run() {
				container.createThreadLocal();
				container.accessThreadLocal();
			}
		};
		
		thread1.start();
		thread2.start();
	}
	
	private static class ThreadLocalContainer {
		private static final ThreadLocal<String> myTLocal = new ThreadLocal<String>();
		
		public void createThreadLocal() {
			myTLocal.set(Thread.currentThread().getName());
		}
		
		public void accessThreadLocal() {
			System.out.println(myTLocal.get());
		}
			
	}
	
	
}
