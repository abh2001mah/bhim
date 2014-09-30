import java.util.Stack;


public class QueueStackOperation {
	
	private Stack<Integer> stack = new Stack<Integer>();

	public static void main(String[] args) {
		QueueStackOperation qso =  new QueueStackOperation();
		/*qso.insertInQueueUsingSingleStack(3);
		qso.insertInQueueUsingSingleStack(2);
		qso.insertInQueueUsingSingleStack(1);
		System.out.println(qso.removeFromQueueUsingSinglestack());
		System.out.println(qso.removeFromQueueUsingSinglestack());
		System.out.println(qso.removeFromQueueUsingSinglestack());*/
		
		qso.recPushSortedStack(3);
		qso.recPushSortedStack(1);
		qso.recPushSortedStack(2);
		System.out.println(qso.removeFromStack());
		System.out.println(qso.removeFromStack());
		System.out.println(qso.removeFromStack());
	}
	
	public void insertInQueueUsingSingleStack(int i) {
		stack.push(new Integer(i));
	}
	
	public int removeFromQueueUsingSinglestack() {
		Integer top = ((Integer)stack.pop()).intValue();
		if(stack.isEmpty())
			return top.intValue();
		Integer ret = removeFromQueueUsingSinglestack();
		stack.push(top);
		return ret.intValue();
	}
	
	public int removeFromStack() {
		if(!stack.isEmpty()) {
			return stack.pop().intValue();
		}
		return -1;
	}
	
	public void recPushSortedStack(int i) {
	//push the new element in a sorted stack, such that the stack remains sorted, min value at top
		Integer I = new Integer(i);
		if(stack.isEmpty() || stack.peek().intValue() > i) {
			stack.push(I);
			return;
		}
		Integer tmp = stack.pop();
		recPushSortedStack(i);
		stack.push(tmp);
	}
}
