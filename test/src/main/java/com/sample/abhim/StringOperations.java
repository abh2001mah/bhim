package com.sample.abhim;


public class StringOperations {
	private static int permuteCount  = 0;

	public static void main(String[] args) {
		StringOperations so =  new StringOperations();
//		System.out.println(so.validParenthese("()()()"));
//		System.out.println(so.validParenthese("((((()))(())()))((()()()))"));
//		System.out.println(so.validParentheseScan("((((()))(())()))()()((()()()))"));
		
		StringBuilder sb = new StringBuilder("my abhim my abhim.");
//		System.out.println(so.reverseWords(sb).toString());
//		sb = new StringBuilder("my abhim my abhim.");
//		System.out.println(so.reverseString(sb, 0, sb.length()-1));
//		sb = new StringBuilder("");
//		so.printParenthesisPermutation(sb, 0, 0, 2, permuteCount);
//		sb = new StringBuilder("aabc");
//		so.printPermutationWithIndex(sb, 10);
	}
	
	public int commntedLines (String s) {
		//Given a source code, you have to count the number of commneted lines in that source code
		//
		return 0;
	}
	
	public boolean validParenthese(String s) {
		//assuming there are any other chars in the String like space, tab
		//Another algorithm to solve this (coded below): scan the string from left to right, when you find any ( push it into a stack,
		//when you find any ) pop ( from the stack. At the end when no more char to scan from string 
		//and no more elements are in the stack, the given string is valid else the string is invalid.
		 
		//a good problem is then given a number N, generate all valid parenthese strings. 
		if(s.length()%2!=0)
			return false;
		StringBuilder sb = new StringBuilder(s);
		ListElement adjacentPairs = adjacentPairIndexs(sb); 
		while(sb.length()>0) {
			while(adjacentPairs!=null) {
				sb.deleteCharAt(adjacentPairs.value);
				sb.deleteCharAt(adjacentPairs.value); //not value+1, because one char already deleted
				adjacentPairs = adjacentPairs.next;
			}
			if(sb.length()>0) {
				adjacentPairs = adjacentPairIndexs(sb);
				if(adjacentPairs==null)
					return false;
			}			
		}
		return true;
	}
	
	public boolean validParentheseV2(String s) {
		//this is better than the upper one because this works even if there are 
		//spaces and tabs present in input string
		if(s.length()%2!=0)
			return false;
		int countOfOpen = 0;
		for(int i=0;i<s.length();++i) {
			if(s.charAt(i)=='(')
				++countOfOpen;
			if(s.charAt(i)==')')
				--countOfOpen;
			if(countOfOpen<0)
				return false;
		}
		if(countOfOpen>0)
			return false;
		return true;
	}
	
	public void printParenthesisPermutation(StringBuilder sb, int nol, int nor, int n, int count){
//		System.out.println((++count)+":"+sb);
		if(nol==n && nor==n){
			System.out.println((++permuteCount)+":"+sb);
		} else {
			if(nol<n){
//				System.out.print("|nol<n|left="+(nol+1)+":");
				printParenthesisPermutation(sb.append('('),nol+1,nor,n, permuteCount);
				sb.deleteCharAt(sb.length()-1);
			}
			if(nol>nor) {
//				System.out.print("|nol>=nor|righ="+(nor+1)+":");
				printParenthesisPermutation(sb.append(')'),nol,nor+1,n,permuteCount);
				sb.deleteCharAt(sb.length()-1);
			}			
		}
	}

	
	public StringBuilder reverseWords(StringBuilder sb) {
		if(sb.length()<=1)
			return sb;
		int begin = -1; int end = -1;
		
		for(int i=0;i<sb.length();++i) {
			if(!(sb.charAt(i)==' ' || sb.charAt(i)=='\t') && begin==-1) {
				begin = i;
			}
			if((sb.charAt(i)==' ' || sb.charAt(i)=='\t') && end==-1 && begin!=-1) {
				end = i-1;
			}
			if(i==sb.length()-1 && end==-1 && begin!=-1)
				end = i;
			if(begin!=-1 && end!=-1) {
				reverseString(sb, begin, end);
				begin = -1; end = -1;
			}
		}
		return sb;
	}
	
	public StringBuilder reverseString(StringBuilder sb, int begin, int end) {
		if(begin>end)
			return null;
		if(begin<0 || end <0)
			return null;
		char ch;
		while(begin<end){
			ch = sb.charAt(begin);
			sb.setCharAt(begin, sb.charAt(end));
			sb.setCharAt(end, ch);
			++begin; --end;
		}
		return sb;
	}
	
	private ListElement adjacentPairIndexs(StringBuilder sb) {
		//making list from last to first pair so that I can delete without change in index for previous pair
		ListElement head = null;
		ListElement tail = null;
		if(sb.length()>0) {
			for(int i=sb.length()-2;i>=0;--i){
				if(sb.charAt(i)=='(' && sb.charAt(i+1)== ')') {
					if(head==null) {
						head = new ListElement(i, null);
						tail = head;
					} else {
						tail.next = new ListElement(i, null);
						tail = tail.next;
					}
				}
			}
		}
		return head;
	}

}
