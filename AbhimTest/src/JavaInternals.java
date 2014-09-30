import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class JavaInternals {
	private static String str = "Global Original";

	public static void main(String[] args) {
		JavaInternals ji = new JavaInternals();
//		ji.checkSuperClassANDSubClass();
		ji.checkEquals();
	}

	public void stringOveride(String s) {
		s = "Overridden";
	}

	public void stringArrayOveride(String [] sArr) {
		sArr[0] = "Overridden";
	}

	public void intergerOveride(Integer I) {
		I = new Integer(-2);
		I.equals(null);
	}

	public void printArray(String [] a, int begin, int end) {
		if(begin>end || begin<0 || end<0)
			return;
		for(int i=begin;i<=end;++i){
			System.out.print(a[i]+",");
		}
		System.out.println();
	}

	public void checkSuperClassANDSubClass() {
		SuperClass superc = new SubClass();
		superc.method("Abhim");

		SubClass subc = new SubClass();
		subc.method("Abhim");
		subc.method(new Object());
	}

	public void CheckPassByRef() {
		String s = "Original";
		Integer I = new Integer(-1);
		String [] sArr = {"Original"};

		stringOveride(s);
		System.out.println(s); //this will print Original string not the overridden one

		s = null;
		stringOveride(s);
		System.out.println(s); //this will print Original string not the overridden one

		stringOveride(str);
		System.out.println(str); //this will also print Original string not the overridden one

		intergerOveride(I);
		System.out.println(I); //this will also print Original integer not the overridden one

		stringArrayOveride(sArr);
		printArray(sArr, 0, 0); //this will print Overridden string not the original one

	}

	public void checkEquals() {
		//the Object.equals() just check the ref equality, not the content of objects
		//String class has overriden equals method to check two Strings char by char

		//if you override equals means you have your own way to define the equality of two objects
		//then you must override hashcode method also because equals objects must have equal has code value

		//hascode is an int value, can be -ve also. By default it is int reprentation of java native object code
		//which is the memory address of object
		StringBuilder sb1 = new StringBuilder("abhim");
		StringBuilder sb2 = new StringBuilder("abhim");
		String s1 = "abhim"; String s2 = "abhim";
		String s3 = new String("abhim"); String s4 = new String("abhim");

		System.out.println((sb1==sb2)+" | "+(s1==s2)+" | "+(s3==s4));//false | true | false

		Map<StringBuilder, Boolean> map1 = new HashMap<StringBuilder, Boolean>();
		map1.put(sb1, Boolean.TRUE);
		System.out.println(map1.containsKey(sb2));//false
		Map<String, Boolean> map2 = new HashMap<String, Boolean>();
		map2.put(s3, Boolean.TRUE);
		System.out.println(map2.containsKey(s4));//true
	}

	public void checkGenerics() {
		List<SuperClass> superList = new LinkedList<SuperClass>();
		List<SubClass> subList = new LinkedList<SubClass>();
		System.out.println(superList.toString()+subList.toString());

		//subList = superList; //compilation error

		//subList = (List<SubClass>)(superList); //still compilation Error

		//superList = subList; //compilation error
	}

}
