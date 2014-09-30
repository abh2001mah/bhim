public class SequenceOperations {
	
	public static void main(String[] args) {
		SequenceOperations so = new SequenceOperations();
		int [] a = {-2, -1, -3, -4, -5}; 
//		{5, 5, 5, -10, -10, -10, 7, 7, 7}; 
//		{4, 3, -10, 3, -1, 2, 0, -3, 5, 7, -4, -8, -10, 4, 7, -30, -2, -6, 4, 7}; 
//		{-1, 2, 2, 3, -2, 1};
		so.maximumContiguousSubArray(a);
		so.maximumContiguousSubArrayV2(a);
//		so.maxSumInCircularArray(a);
	}
	
	public void maximumContiguousSubArray(int []a) {
		int first = 0;
		int last = 0;
		int cs = 0;
		int ms = a[0];
		int tmp_first = 0;
		for(int i=0;i<a.length;++i) {
			cs += a[i];
			if(cs>ms) {
				first = tmp_first;
				ms = cs;
				last = i;
			}
			if(cs<0) {
				cs = 0;
				tmp_first = i+1;
			}
		}
		System.out.print(ms+" |"+first+","+last+"| ");
		ArrayOperations ao = new ArrayOperations();
		ao.printArray(a, first, last);
	}
	
	public void maximumContiguousSubArrayV2(int [] arr) {
		int maxsofar = arr[0];
		int maxendinghere = arr[0];
		for(int index=0;index<arr.length;++index){
			maxendinghere = Math.max(maxendinghere+arr[index], arr[index]);
			maxsofar = Math.max(maxsofar, maxendinghere);			
		}
		System.out.println("maxsofar="+maxsofar+"|maxendinghere="+maxendinghere);
	}

	
	public void maxSumInCircularArray(int [] a) {
		//maxNeg is the index of max -ve element, if no -ve then maxNeg = -1.
		int maxNeg = -1;int tmp = 0;
		for(int i=0; i<a.length; ++i) {
			if(a[i]<0){
				maxNeg = i;
			}
			tmp += a[i];
		}
		boolean doubleCount = false;
		if(tmp>0) {
			doubleCount = true;
		}
		int first = 0;int last = 0;int cs = 0;int ms = a[0];int tmp_first = 0;
		if(maxNeg == -1) { //all +ve elements in the array
			first = 0; last = a.length;
			for(int i=1;i<a.length;++i)
				ms += a[i];
			System.out.println(ms+"|"+first+","+last+"|");
			return;
		}		
		if(doubleCount) {
		//find out all consecutive -ve elements which has highest -ve sum togather, we need to leave those elements
			int negSum = 0;int negFirst = -1; int negLast = 0;tmp = 0;tmp_first=-1;
			for(int i=0;i<2*a.length-1;++i) {
				if(a[i%a.length]<0){
					tmp += a[i%a.length];
					if(tmp_first == -1) {
						tmp_first = i%a.length;
					}
				}
				if(a[i%a.length]>0) {
					if(tmp<negSum) {
						negSum = tmp;
						tmp = 0;
						negFirst = tmp_first;
						negLast = (i%a.length)-1;
						tmp_first = -1;
					}					
				}
			}
//			System.out.println(negSum+"|"+negFirst+","+negLast);
			ms = 0;
			if(negFirst<=negLast) {
				for(int i=negLast+1;;++i){
					ms += a[i%a.length];
					if(i%a.length == negFirst-1)
						break;
				}
				System.out.println(ms+"|"+(negLast+1)+","+(negFirst-1)+"|");
			}
			else {
				for(int i=negLast+1;i<negFirst;++i) {
					ms += a[i];
				}
				System.out.println(ms+"|"+(negLast+1)+","+(negFirst-1)+"|");
			}
		} else {
			for(int i=0;i<2*a.length-1;++i) {
				cs += a[i%a.length];
				if(cs>ms) {
					first = tmp_first;
					ms = cs;
					last = i%a.length;				
				}
				if(cs<0) {
					cs = 0;
					tmp_first = (i%a.length)+1;
				}		
					
			}
			if(first<=last) {
				tmp = 0;
				for(int i=first;i<=last;++i)
					tmp += a[i];
				if(tmp==ms) {
					System.out.println(ms+"|"+first+","+last+"|");
					return;
				}			
			} else {
				tmp = 0;
				for(int i=first;;++i) {
					tmp += a[i%a.length];
					if(i%a.length==last)
						break;
				}				
				if(tmp==ms) {
					System.out.println(ms+"|"+first+","+last+"|");
					return;
				}
			}
		}
	}
}
