
public class ArrayOperations {


	public static void main(String[] args) {

		ArrayOperations ao = new ArrayOperations();
//		int [] a = {1,2,3,4,5,6}; ao.rotateArray(a, -3);
//		int [] a = {4,3,0,5,3}; ao.placeCorrect(a);
//		int [] a = {4,3,-2,7,-2,-2,6,8,9,12,8,6,9,5};
//		ao.printConSeq(a, 14);

		/*int [][] a2 = new int[6][6]; int count = 0;
		for(int i=0;i<a2.length;++i) {
			for(int j=0;j<a2[0].length;++j) {
				a2[i][j] = ++count;
			}
		}
		for(int j=0;j<a2[0].length;++j) {
			for(int i=0; i<a2.length;++i) {
				a2[i][j] = ++count;
			}
		}*/
//		ao.spiralAccessOfMatrix(a2);
//		ao.recSpiralAccessOfMatrix(a2, 0, a2.length-1, 0, a2[0].length-1);
//		a2[0][3]=12; a2[1][3]=13; a2[2][3]=14; a2[3][3]=18; System.out.println(ao.findNumberInSortedMatrix(a2, 16));

//		int [] a = {1,3,6}; int [] b = {2,-1,4,-1,5,-1};
//		ao.mergeTwoSortedArray(a, b);

//		ao.printMatrix(a2);ao.sortedPrintInSortedMatrix(a2);


		int [] a = {1}; StringBuilder [] sbs = ao.generatePowerSet(a, a.length);
		System.out.println("Total = "+sbs.length);
		for(int i=0; i<sbs.length; ++i) {
			System.out.println(sbs[i]);
		}
	}

	public void printArray(int [] a, int begin, int end) {
		if(begin>end || begin<0 || end<0)
			return;
		for(int i=begin;i<=end;++i){
			System.out.print(a[i]+",");
		}
		System.out.println();
	}

	public void printMatrix(int [][]a2) {
		for(int i=0;i<a2.length;++i) {
			for(int j=0;j<a2[i].length;++j) {
				if(a2[i][j]/10 == 0) {
					System.out.print(a2[i][j]+"  ");
				} else {
					System.out.print(a2[i][j]+" ");
				}
			}
			System.out.println();
		}
	}

	public void rotateArray(int [] a, int pos) {
		//rotate an array, +ve pos right rotate, -ve pos left rotate
		//you are not supposed to use one more array to copy values at final location
		//in that array, use O(1) space only. final index = (org index+pos)%a.length
		printArray(a,0,a.length-1);
		if(pos==0 || pos==a.length || pos==-1*a.length)
			return;
		if(pos > a.length || pos < -1*a.length) //error condition, pos is out of range
			return;
		if(pos<0)
			pos = a.length+pos;
		int count = 0;
		int index = 0;int start_index = 0;int fi = (index+pos)%a.length;
		int tmp1 = a[index];int tmp2 = 0;
		while(count<a.length) {
			fi = (index+pos)%a.length;
			tmp2 = a[fi];
			a[fi] = tmp1;
			tmp1 = tmp2;
			index = fi;
			if(index==start_index) {
				index = ++start_index;
				tmp1 = a[index];
			}
			++count;
		}
		printArray(a,0,a.length-1);
	}

	public void placeCorrect(int [] a) {
		//Given an array n elements, if there are elements in this array of range 0 to n-1,
		//pleace them at their respective indexes. Rest other elemets which are not in the
		//range of 0 to n-1, please them anywhere you want. For exmaple an 5 element array
		//I1 = {3,2,1,0,4} -> F1 = {0,1,2,3,4} | I2 = {2,2,0,4,3} -> F2 = {0,2,2,3,4}
		//I3 = {4,-2,0,5,3} -> F3 = {0,-2,5,3,4} | I3 = {4,3,0,5,3} -> F3 = {0,5,3,3,4}
		printArray(a,0,a.length-1);
		int index = 0;
		int tmp = 0;
		while(index<a.length) {
			if(a[index] < a.length && a[index]>=0 && a[index]!=index && a[a[index]]!=a[index]) {
				//means this element needs to placed at its correct index
				tmp  = a[a[index]];
				a[a[index]] = a[index];
				a[index] = tmp;
			}
			++index;
		}
		printArray(a,0,a.length-1);
	}

	public void reArrange(int [] a) {//incomplete code
	//Given an array of positive and negative integers, re-arrange it so that you have
	//postives on one end and negatives on the other, BUT retain the original order of appearance.
	//For eg. 1, 7, -5, 9, -12, 15 => -5, -12, 1, 7, 9, 15
		int countNegtive = 0;
		for(int i=0;i<a.length;++i){
			if(a[i]<0)
				++countNegtive;

		}

	}


	private int XORtheArray(int [] arr) {
		int tmp = arr[0];
		for(int i=1;i<arr.length;++i){
			tmp ^= arr[i];
		}
		return tmp;
//		System.out.println(tmp);
	}

	public void printConSeq(int []a, int sum) {
		//incomplete, it missed 6,8 (sum 14) in the above example
		//print the sequences of consequtive integers in a list that add to a particular number.
		int current = 0;int i=0;int j=0;
		for(i=0,j=0;j<a.length;++j) {
			while (current >= sum) {
				if(current == sum) {
					printArray(a,i,j-1);
				}
				current -= a[i++];
			}
			current += a[j];
		}
		if(current == sum) {
			printArray(a,i,j-1);
		}
	}

	public void smallestKthElement(int [] a, int [] b, int k) {
	//find the kth smallest element in the union of two SORTED array a and b
	}

	public StringBuilder[] generatePowerSet(int [] a, int l) {
	//one way to generate power set is that generate all the numbers from 0 to 2^n.
	//convert each number to its binary form and place the array number to places
	//where indexes are 1 in the binary form. For example, an array of 2 numbers 1 and 2.
	//Total 2^2=4 sets will be generated. (binary form 0=00, 1=01, 2=10, 3=11). Now sets are
	//00={}; 01={2}, 10={1} and 11={1,2}

	//another way to is using recursion, implemented below
		if(a!=null) {
			if(l==0) {
				StringBuilder [] sArray = {new StringBuilder(",")};
				return sArray;
			} else {
				StringBuilder [] pset1 = generatePowerSet(a,l-1);
				StringBuilder [] pset2 = new StringBuilder[pset1.length];
				for(int i=0; i<pset2.length; ++i) {
					pset2[i] = new StringBuilder(pset1.toString()+","+a[l-1]);
				}
				StringBuilder [] pset3 = new StringBuilder[2*pset1.length];
				for(int i=0;i<pset1.length;++i) {
					pset3[i] = pset1[i];
				}
				for(int i=pset1.length; i<pset3.length; ++i) {
					pset3[i] = pset2[i];
				}
				return pset3;
			}
		}
		return null;
	}

	public void mergeTwoSortedArray(int []a, int []b) {//incomplete, little bit difficult to write this code :(
	//merge two sorted arrays with using constant memory only, then print both arrays
	//array b has extra space to accomodate all the elements of array a, so finally all elements shud be present in array b in sorted order
	//the extra space could be at random indexes in b with value -1

	//first place all the elements of b at the end of b, sothat the initial space in b is free
		int i = b.length-1; int j = b.length-1;
		while(true) {
			if(b[j]!=-1){
				--j;
				i = j-1;
			}
			if(b[i]==-1){
				--i;
			}
			if(i<0)
				break;
			if(b[i]!= -1 && b[j]== -1) {
				b[j] = b[i];
				b[i] = -1;
			}
		}
		if(a[a.length-1]<=b[a.length]) {//a[max]<=b[min]
			for(i=0;i<a.length;++i) {
				b[i] = a[i];
			}
			printArray(b, 0, b.length-1);
			return;
		}
		if(b[b.length-1]<=a[0]) {//b[max]<=a[min]
			rotateArray(b,-(a.length));
			j = a.length-1;
			for(i=0,j=a.length;i<a.length;++i,++j) {
				b[j] = a[i];
			}
			printArray(b, 0, b.length-1);
			return;
		}
		printArray(a, 0, a.length-1);
		printArray(b, 0, b.length-1);
		i = 0; j = a.length;int tmp = 0;
		while(i<a.length && j<b.length) {
			if(a[i]<=b[j]) {
				b[tmp] = a[i];
				++i;
			} else {
				b[tmp] = b[j];
				b[j] = -1;
				++j;
			}
			++tmp;
		}
		if(j==b.length) {
			b[tmp] = a[i];
		}
		printArray(b, 0, b.length-1);
	}

	public void spiralAccessOfMatrix(int [][] a) {
		int rows = a.length; int cols = a[0].length;
		if(rows>0 && cols>0) {
			int up = 0; int down = rows-1;
			int left = 0; int right = cols-1;
			while(up<down && left<right) {
				for(int i=up,j=left;j<=right;++j){//printing the row of index up
					System.out.print(a[i][j]+",");
				}
				++up;
				if(up<rows) {
					for(int i=up,j=right;i<=down;++i) {//printing the column of index right
						System.out.print(a[i][j]+",");
					}
				}
				--right;
				if(right>=0) {
					for(int i=down,j=right;j>=left;--j) {//printing the row of index down
						System.out.print(a[i][j]+",");
					}
				}
				--down;
				if(down>=0) {
					for(int i=down,j=left;i>=up;--i) {//printing the column of index left
						System.out.print(a[i][j]+",");
					}
				}
				++left;
			}
			if(up==down && left==right) {//printing the last element like a[0][0] for one element only
				System.out.print(a[up][left]+",");
			} else {
				if(up==down) {//printing the last row
					for(int i=up,j=left;j<=right;++j){
						System.out.print(a[i][j]+",");
					}
				}
				if(left==right) {//printing the last column
					for(int i=up,j=left;i<=down;++i){
						System.out.print(a[i][j]+",");
					}
				}
			}
		}
		System.out.println();
	}

	public void recSpiralAccessOfMatrix(int [][] a, int up, int down, int left, int right) {
		if(up>down || left>right || down<0 || right<0) {
			System.out.println();
			return;
		}
		if(up==down && left==right) {
			System.out.print(a[up][left]+",");
			System.out.println();
			return;
		} else {
			if(up==down) {
				for(int i=up,j=left;j<=right;++j){
					System.out.print(a[i][j]+",");
				}
				System.out.println();
				return;
			}
			if(left==right) {
				for(int i=up,j=left;i<=down;++i){
					System.out.print(a[i][j]+",");
				}
				System.out.println();
				return;
			}
		}
		for(int i=up,j=left;j<=right;++j){
			System.out.print(a[i][j]+",");
		}
		++up;
//		if(up<rows) {
			for(int i=up,j=right;i<=down;++i) {
				System.out.print(a[i][j]+",");
			}
//		}
		--right;
//		if(right>=0) {
			for(int i=down,j=right;j>=left;--j) {
				System.out.print(a[i][j]+",");
			}
//		}
		--down;
//		if(down>=0) {
			for(int i=down,j=left;i>=up;--i) {
				System.out.print(a[i][j]+",");
			}
//		}
		++left;
		recSpiralAccessOfMatrix(a, up, down, left, right);
	}

	public boolean findNumberInSortedMatrix(int [][] a, int number) {
	//asuming top-left is min element and bot-right is max element
		if(a==null)
			return false;
		if(a[0][0] > number)
			return false;
		if(number > a[a.length-1][a[0].length-1])
			return false;
		int rows = a.length; int cols = a[0].length;
	//start with bot-left corner, if the element is greater than the number then go up else go right
	//till you either find the number or reaches the end of matrix
		printMatrix(a);
		int i = rows-1; int j=0;
		while(i<rows && j<cols) {
			System.out.print(i+","+j+" -> ");
			if(a[i][j] == number)
				return true;
			else if(a[i][j] > number)
				i--;
			else if(a[i][j] < number)
				j++;
		}
		return false;
	}

	public void sortedPrintInSortedMatrix(int [][]a) {
		if(a!=null) {
			int rows = a.length; int cols = a[0].length; int count = 0;
			int maxi = rows-1; int maxj = cols-1; int tmp = 0;int just_printed = a[0][0];
			int [] maxImaxJ = {maxi, maxj};
			while(count<rows*cols-1) {
				just_printed = a[0][0];
				System.out.print(a[0][0]+",");
				tmp = a[0][0];
				a[0][0] = a[maxi][maxj];
				a[maxi][maxj] = tmp;
				heapifyMatrix(a, rows, cols, just_printed, maxImaxJ);
				maxi = maxImaxJ[0];maxj=maxImaxJ[1];
				++count;
			}
			System.out.println(a[0][0]);
			printMatrix(a);
		}
	}

	private int[] heapifyMatrix(int [][] a, int rows, int cols, int just_printed, int [] maxImaxJ) {
		int tmp = 0; int i = 0; int j=0; boolean move = true; int count=0;
		while(move) {
			tmp = a[i][j]; move = false;
			if(i<rows-1 && j<cols-1) {
				if(a[i+1][j]>just_printed && a[i][j+1]>just_printed) {
					if(a[i][j+1]>a[i+1][j]) {
						a[i][j] = a[i+1][j];
						a[i+1][j] = tmp;
						++i;
					} else {
						a[i][j] = a[i][j+1];
						a[i][j+1] = tmp;
						++j;
					}
					move = true;++count;
					continue;
				}
				if(a[i+1][j]>just_printed) {
					a[i][j] = a[i+1][j];
					a[i+1][j] = tmp;
					++i;
					move = true;++count;
					continue;
				}
				if(a[i][j+1]>just_printed) {
					a[i][j] = a[i][j+1];
					a[i][j+1] = tmp;
					++j;
					move = true;++count;
					continue;
				}
			}

			if(i==rows-1 && j<cols-1 && a[i][j+1]>just_printed) {
				a[i][j] = a[i][j+1];
				a[i][j+1] = tmp;
				++j;move = true;++count;
			}

			if(i<rows-1 && j==cols-1 && a[i+1][j]>just_printed) {
				a[i][j] = a[i+1][j];
				a[i+1][j] = tmp;
				++i;move = true;++count;
			}
		}
//		System.out.println("|"+count+"|"+(i)+","+(j));printMatrix(a);
		maxImaxJ[0] = i;maxImaxJ[1] = j;
		return maxImaxJ;
	}
}
