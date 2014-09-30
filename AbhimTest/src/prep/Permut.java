package prep;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.atomic.AtomicInteger;

public class Permut {
	private static final byte[] valueData       = "AAAAAAAAAAAAAAAAAAAAAAAAAAA".getBytes();
	private static final int    size            = valueData.length;

	public static void main(String[] args) {
		System.out.println(Integer.MAX_VALUE);
		Object o = new Object();
		synchronized (o) {
			try {
				o.wait(10000);
			} catch (InterruptedException e) {
				System.out.println(e);
			}
		}
		System.out.println(size);
		try {
			System.out.println(InetAddress.getLocalHost().getHostName());
			System.out.println(Runtime.getRuntime().exec("hostname"));
		} catch (Exception e1) {
			
		}
		
		Permut permut = new Permut();
		//		permut.printParenthesis(2);
		permut.printPermutations("abc");

		String[] cmd = new String[] { "/bin/ls", "~/", };
		try {
			System.out.println("running " + cmd);
			Process process = Runtime.getRuntime().exec(cmd);
			System.out.println("running " + cmd);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	/**
	 * Prints all valid permutations of parenthesis 
	 * @param number count of ( or ) in permutation
	 */
	public void printParenthesis(int number) {
		if(number <=0) {
			return;
		}
		StringBuilder sb = new StringBuilder();
		printPara(sb, 0, 0, number, new AtomicInteger());
	}

	private void printPara(StringBuilder sb, int leftcount, int rightCount, int number, AtomicInteger count) {
		if(leftcount == number && rightCount == number) {
			System.out.println(count.incrementAndGet()+": "+sb);
			return;
		}
		if(leftcount < number) {
			printPara(sb.append("("), leftcount+1, rightCount, number, count);
			sb.deleteCharAt(sb.length()-1);
		}
		if(leftcount > rightCount) {
			printPara(sb.append(")"), leftcount, rightCount+1, number, count);
			sb.deleteCharAt(sb.length()-1);
		}
	}

	public void printPermutations(String str) {
		if(str == null || str.isEmpty()) {
			return;
		}
		StringBuilder sb = new StringBuilder(str);
		printPermute(sb,0,sb.length()-1,new AtomicInteger());
	}

	private void printPermute(StringBuilder sb, int start, int end, AtomicInteger count) {
		if(start == end) {
			System.out.println(count.incrementAndGet()+":"+sb);
			return;
		}
		for(int i=start+1; i <=end; ++i) {
			//			if(i != start) {
			swap(sb,start,i);
			printPermute(sb, start+1, end, count);
			swap(sb,start,i);	
			//			}
		}
	}

	private void swap(StringBuilder sb, int start, int i) {
		char ch = sb.charAt(start);
		sb.setCharAt(start, sb.charAt(i));
		sb.setCharAt(i, ch);
	}
}
