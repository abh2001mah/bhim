
public class Node {

	int value;
	Node left = null;
	Node right = null;
	int LSTNodes = 0;
	int RSTNodes = 0;
	Node parent;
	
	public Node (int val, Node l, Node r) {
		this.value = val;
		this.left = l;
		this.right = r;
	}

}

class LCAClass {
	boolean f1 = false;
	boolean f2 = false;
	Node node = null;
}
