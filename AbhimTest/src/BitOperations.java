
public class BitOperations {

	public static void main(String [] args) {
		BitOperations bo = new BitOperations();
		bo.reverseBit(6);
		bo.reverseBit(0);bo.reverseBit(8);bo.reverseBit(-1);bo.reverseBit(Integer.MIN_VALUE+1);
	}
	
	public void reverseBit(int number) {
//		final int origNum = number;
		String binRep = Integer.toBinaryString(number);
		System.out.println(number+"\n"+binRep+" "+ binRep.length());
		int revNumber = 0;
		int andProd = 0; boolean found = false;
		do {
			andProd = number & 1;
			number >>>=1;
			if(andProd == 0 && !found) {
				continue;
			}
			found = true;
			revNumber <<= 1;
			revNumber |= andProd;
		} while(number > 0);
		binRep = Integer.toBinaryString(revNumber);
		System.out.println(binRep+" "+ binRep.length());
		System.out.println(revNumber+"\n-----------------");
	}
	
	
	
}
