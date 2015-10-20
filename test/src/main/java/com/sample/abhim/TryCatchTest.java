package com.sample.abhim;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.TimeUnit;


public class TryCatchTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TryCatchTest tct = new TryCatchTest();
		System.out.println(tct.testFinallyReturn());
		tct.testFinallyWithInturrupts();
		tct.testFinallyWithExit();
	}
	
	public void testFinallyWithInturrupts() {
		final CyclicBarrier barrier = new CyclicBarrier(2);
		Runnable runnable = new Runnable() {
			public void run() {
				try {
					TimeUnit.SECONDS.sleep(5);
					barrier.await();
				} catch (Throwable th) {
//					th.printStackTrace();
				} finally {
					System.out.println("in finally after barrier.await()");
				}
			}
		};
		Thread thread= new Thread(runnable);
		thread.start();
		thread.interrupt();
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	//this will return 3 or NPE when we un-comment in finally block 
	public int testFinallyReturn() {
		String s = null;
		try {
			s.length();
			return 1;
		} catch (Throwable th) {
			return 2;
		} finally {
//			s.length();
			return 300;
		}
	}
	
	public void testFinallyWithExit() {
		BufferedReader in = null;
		try {
			in = new BufferedReader(new FileReader("foo.in"));
			System.exit(0);
			return;
		} catch(FileNotFoundException e) {
			
		} finally {
			System.out.println("In finally FileNotFoundException");
			if(in!=null) {
				try {
					in.close();
				} catch (IOException e) {
					
				} finally {
					System.out.println("In finally IOException");
				}
				
			}
		}
	}

}
