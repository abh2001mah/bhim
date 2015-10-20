package com.sample.abhim;
import java.io.IOException;
import java.util.Map;
import java.util.WeakHashMap;

/* The pool got created using intern() is a Weak Pool and the pool got created using "ABHIM" is a 
 * Strong Pool. So when we do the following :
 * String str1 = new String("newString1"); then "newString1" got added into the Strog Pool
 * String str2 = "literalString2"; then "literalString2" got added into the Strong Pool
 * String str3 = new String("newString3")+"3"; then "3" got added into Strong Pool
 * String str4 = new String("newString4").intern() then "newString4" got added into Strong Pool 
 * 			and that ref got returned, means str4 is a Strong ref.
 * String str5 = (new String("newString5")+"5").intern(); then "newString55" got added in Weak Pool
 * 
 * So bottom line : intern() will return the strong ref if that string is already present in constant Pool
 * 	else it will add the ref in weak pool and return the same. So there are NO duplicate entry in Weak Pool.
 */

public class TestWeakHashMap
{
   private String str1 = new String("newString1");
   private String str2 = "literalString2";
   private String str3 = "literalString3";
   private String str4 = new String("newString4");
   
   private Map<String, Object> map = new WeakHashMap<String, Object>();

   private void testGC() throws IOException
   {
	   str4 = (str4+"4").intern();
       map.put(str1, new Object());
       map.put(str2, new Object());
       map.put(str3, new Object());
       map.put(str4, new Object());

       /**
        * Discard the strong reference to all the keys
        */
       str1 = null;
       str2 = null;
       str3 = null;
       str4 = null;
       int count = 0;
       while (count<100) {
           System.gc();
           /**
            * Verify Full GC with the -verbose:gc option
            * We expect the map to be emptied as the strong references to
            * all the keys are discarded.
            */
           System.out.println("map.size() "+ map.size() + "  " + map);
           ++count;
       }
   }
   
	/**
	 * @param args
	 */
	public static void main(String[] args) throws IOException {
		TestWeakHashMap twhm = new TestWeakHashMap();
		twhm.testGC();
	}

}
