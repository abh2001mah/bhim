package com.sample.abhim;
public class NumberOperations {


	public static void main(String[] args) {
//		NumberOperations no = new NumberOperations();
//		System.out.println(no.power(2, 17)+"|"+Math.pow(2, 17));
//		Integer i = new Integer(-5);
//		System.out.println(Integer.toBinaryString(-5));
//		System.out.println(Integer.toBinaryString(5));
//		System.out.println(no.gcd(2, 3));System.out.println(no.gcd(3, 2));
//		System.out.println(no.lcm(2, 3));System.out.println(no.lcm(3, 2));
	}

	public int power(int a, int pow) {
		if(pow<0)
			return -1;
		if(pow==0)
			return 1;
		if(pow==1)
			return a;
		if(pow==2)
			return a*a;
		int p = a;
		int index = 1;
		while(2*index <= pow){
			p = p*p;
			index = 2*index;
		}
		if(pow-index>0)
			return p*power(a,pow-index);
		return p;
	}

	public int Division(int num, int denom) { //(4,2)
		int a=0, b=0;
		int i= 31; // CAREFUL: works only on int=32-bit machine!
		/* Work from leftmost to rightmost bit in numerator */
		while(i>=0) {
			/* appends one bit from numerator to a */
			a = (a << 1) + ((num & (1 << i)) >> i);
			b = b << 1;
			System.out.println(i+":After shifting: "+a+"|"+b);
			if (a >= denom) {
				a -= denom;
				b++;
			}
			System.out.println(i+":After subtraction: "+a+"|"+b);
			i--;
		}
		System.out.println(a+"|"+b);
		return b;
	}

	public int gcd(int a, int b) {
		if(a==0)
			return b;
		if(b==0)
			return a;
		if(a==b)
			return a;
		if(a>b)
			return gcd(b,a%b);
		else
			return gcd(a,b%a);
	}

	public int lcm(int a, int b) {
		if(a==0)
			return 1;
		if(b==0)
			return 1;
		if(a==b)
			return a;
		return a*b/gcd(a,b);
	}

}
