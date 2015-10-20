package com.sample.abhim;
public class ListOperations {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ListOperations lo = new ListOperations();

		int [] arr1 = {1,2,3};
		int [] arr2 = {3,2,1};
		ListElement head1 = lo.prepareList(arr1);
		ListElement head2 = lo.prepareList(arr2);
//		lo.printList(head);
//		lo.printList(lo.recReverseList(head, null)); (call either) lo.printList(lo.reverseList(head));
//		lo.printRevList(head1);
		lo.isReverseofEachOther(head1, head2);

//		int [] oneArr = {1,3,5,7,13};
//		int [] twoArr = {2,4,6,8,9,10,11,12,14,15};
//		ListElement one = lo.prepareList(oneArr);
//		ListElement two = lo.prepareList(twoArr);
//		lo.printList(lo.mergeTwoSortedList(one, two)); (call either) lo.printList(lo.recMergeTwoSortedList(one, two));

//		lo.convertNumbertoList(10000,null);

	}

	public ListElement prepareList(int[] arr) {
		ListElement head = new ListElement(arr[0],null);
		ListElement tail = head;
		for(int i=1;i<arr.length;++i) {
			ListElement tmp = new ListElement(arr[i], null);
			tail.next = tmp;
			tail = tail.next;
		}
		return head;
	}

	public void printList(ListElement head) {
		while(head!=null) {
			System.out.print(head.value+"->");
			head = head.next;
		}
		System.out.println();
	}

	public void printRevList(ListElement head) {
	    if(head==null) {
	        return;
	    }
	    ListElement tmp = head.next;
	    if(tmp!=null) {
	        printRevList(tmp);
	    }
	    System.out.print(head.value+"->");
	}

	public boolean isReverseofEachOther(ListElement head1, ListElement head2) {
	    if(head1==null && head2==null) {
	        return true;
	    }
	    if(head1==null && head2!=null) {
	        return false;
	    }
	    if(head1!=null && head2==null) {
            return false;
        }
	    boolean ret = ReverseofEachOtherHelper(head1, head2);
	    System.out.println(ret);
	    return ret;
	 }

	public boolean ReverseofEachOtherHelper(ListElement head1, ListElement head2) {
	    boolean isEqual = false;
	    if(head1.next!=null) {
	        isEqual = ReverseofEachOtherHelper(head1.next, head2);
	    } else {
	        return head1.value==head2.value;
	    }
	    if(head2.next==null || !isEqual) {
	        return false;
	    }
	    head2 = head2.next;
	    return isEqual && head1.value == head2.value;
	}

	public ListElement recReverseList(ListElement head, ListElement tmp) { //recursive reverse
		ListElement rhead = null;
		if(head!=null) {
			if(head.next!=null) {
				rhead = recReverseList(head.next,head);
			} else {
				rhead = head;
			}
			head.next = tmp;
			return rhead;
		}
		return null;
	}

	public ListElement reverseList(ListElement head) {//iterative reverse
		ListElement rhead = null;ListElement tail = null;
		if(head==null)
			return null;
		if(head.next==null)
			return head;
		rhead = head;
		tail = head.next;
		ListElement thead = tail.next;
		while(thead!=null){
			tail.next = rhead;
			rhead = tail;
			tail = thead;
			thead = thead.next;
		}
		tail.next = rhead;
		head.next = null;
		return tail;
	}

	public ListElement mergeTwoSortedList(ListElement one, ListElement two) { //iterative merge
		ListElement mergedHead = null;
		if(one==null && two==null)
			return null;
		if(one==null && two!=null)
			return two;
		if(one!=null && two==null)
			return one;
		if(one.value > two.value) {
			mergedHead = two;
			two = two.next;
		} else {
			mergedHead = one;
			one = one.next;
		}
		ListElement tail = mergedHead;
		while(one !=null || two !=null) {
			if(one!=null && two!=null){
				if(one.value > two.value) {
					tail.next = two;
					two = two.next;
				} else {
					tail.next = one;
					one = one.next;
				}
				tail = tail.next;
			} else if(one==null && two!=null) {
				tail.next = two;
				break;
			} else if(one!=null && two==null) {
				tail.next = one;
				break;
			}
		}
		return mergedHead;
	}

	public ListElement recMergeTwoSortedList(ListElement one, ListElement two) { //recursive merge
		ListElement mergedHead = null;
		if(one==null && two==null)
			return null;
		if(one==null && two!=null)
			return two;
		if(one!=null && two==null)
			return one;
		if(one.value > two.value) {
			mergedHead = two;
			mergedHead.next = recMergeTwoSortedList(one, two.next);
		} else {
			mergedHead = one;
			mergedHead.next = recMergeTwoSortedList(one.next, two);
		}
		return mergedHead;
	}

	public void convertNumbertoList(int n,ListElement le) {
	//Given an unsigned integer 1345, the program constructs a linked list of 1->3->4->5.
		ListElement ret = new ListElement(n%10, null);
		ret.next = le;
		if(n/10>0)
			convertNumbertoList(n/10,ret);
		else
			printList(ret);
	}
}
