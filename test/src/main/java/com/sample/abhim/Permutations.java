package com.sample.abhim;
import java.util.Arrays;


public class Permutations {
	private static int permuteCount  = 0;
//	private StringBuilder builder;
	private static int count = 0;

	public Permutations(String s) {
//		builder = new StringBuilder(s);
	}

	public Permutations() {
	}

	public void ValidParenthesisPermutation(StringBuilder sb, int nol, int nor, int n){
//		System.out.println((++count)+":"+sb);
		if(nol==n && nor==n){
			System.out.println((++count)+":"+sb);
		} else {
			if(nol<n){
//				System.out.print("|nol<n|left="+(nol+1)+":");
				ValidParenthesisPermutation(sb.append('('),nol+1,nor,n);
				sb.deleteCharAt(sb.length()-1);
			}
			if(nol>nor) {
//				System.out.print("|nol>=nor|righ="+(nor+1)+":");
				ValidParenthesisPermutation(sb.append(')'),nol,nor+1,n);
				sb.deleteCharAt(sb.length()-1);
			}

		}
	}

	public void JuggleLeftRotate(StringBuilder sb, int i){
		if(i==0){
			return;
		}
		int len = sb.length();
		int index = 0;
		int dst = len-i+index;
		char tmp1 = sb.charAt(index);
		char tmp2 = sb.charAt(dst);
		while(dst!=0) {
			sb.setCharAt(dst, tmp1);
			index = dst;
			dst = (index>=i) ? (index-i) : (len-i+index);
			tmp1 = tmp2;
			tmp2 = sb.charAt(dst);
		}
		sb.setCharAt(dst, tmp1);
		System.out.println(sb);
	}

	public StringBuilder RecursiveLeftRotate(StringBuilder sb, int start, int end){//incomplete
		if(start==end){
			return sb;
		}
		char tmp1;
		if(end-1 == start){
			tmp1 = sb.charAt(start);
			sb.setCharAt(start, sb.charAt(end));
			sb.setCharAt(end,tmp1);
			return sb;
		}
		sb = RecursiveLeftRotate(sb, start, end-1);
		sb = RecursiveLeftRotate(sb, end, sb.length()-1);
		sb = RecursiveLeftRotate(sb, start, sb.length()-1);
		return sb;
	}
	
	public void printPermutationWithIndex(StringBuilder sb, int index){
		// if we print all the permutation of sb in sorted order and then index them with string index as 1
		// then print only that permutation which has index equals to index given in method
		// you can assume that sb has unique char in it and supplied in sorted order
		StringBuilder consturctedsb = new StringBuilder(); 
		int number = 1; int charindex = 0; int len = sb.length();
		for(int i=len; i>0; --i) {
			number *= i;			
		}
		if(index>number || index < 1) {
			System.out.println("Index is out of range error");
			return;
		}
		if(index==1) {
			System.out.println(sb);
			return;
		}
		number = 1;			
		for(int i=0; i<len; ++i) {
			number = calculateValueForIndex(sb.length());
			if(index%number == 0) {
				charindex = index/number;
			} else {
				charindex = index/number+1;
			}
			char ch = sb.charAt(charindex-1);
			consturctedsb.append(ch);
			sb.deleteCharAt(charindex-1);
			if(charindex>0) {
				index -= (charindex-1)*number;
			}
			
		}
		System.out.println(consturctedsb);
	}
	
	private int calculateValueForIndex(int len) {
		int number = 1;
		for(int i=len-1; i>=1; --i) {
			number *=i; 
		}
		return number;			
	}
	
	public void printPermutations(StringBuilder sb, int i, int j, int count) {
		//supply only sorted string to this method, the string can have same character multiple times
		if(i==(j-1)) {
			System.out.println((++permuteCount)+" "+sb+" "+sb.toString().hashCode());
			return;
		}		
		for(int index = i; index<j; ++index) {
			if(!(index!=i && sb.charAt(i) == sb.charAt(index))) {
				swap(sb, i, index);
				printPermutations(sb, i+1, j, permuteCount);
				swap(sb, i, index);
			}
		}
	}
		
	private void swap(StringBuilder sb, int i, int j) {
		char ch = sb.charAt(i);
		sb.setCharAt(i, sb.charAt(j));
		sb.setCharAt(j, ch);
	}

	public StringBuilder stringSort(String string) {
		char [ ] content = string.toCharArray();
		Arrays.sort(content);
		return new StringBuilder(new String(content));
	}

	public static void main(String[] args) {

		StringBuilder sb = new StringBuilder("abc");
		Permutations per = new Permutations();

//		per.StringPermutation(sb,0,sb.length(),0);
		sb = new StringBuilder("(");
//		per.ValidParenthesisPermutation(sb, 1, 0, 2);

		sb = new StringBuilder("abcdefgh");
//		per.JuggleLeftRotate(sb, 3);
//		per.RecursiveLeftRotate(sb, 0, 4);
		sb = per.stringSort("abca");
		per.printPermutations(sb, 0, sb.length(), permuteCount);permuteCount = 0;
		System.out.println(sb);
	}

}
