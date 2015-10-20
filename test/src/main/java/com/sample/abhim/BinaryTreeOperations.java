package com.sample.abhim;
public class BinaryTreeOperations {

	private static int counter = 0;
//	private static Node first = null;
//	private static Node second = null;

	public static void main(String[] args) {
		BinaryTreeOperations bto = new BinaryTreeOperations();
		int [] a = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
		Node root = null;
		root = bto.prepareBinaryTreeFromSortedArray(a,0,a.length-1,null);
//		bto.printInOrder(root);System.out.println();
//		bto.printReverseInOrder(root);System.out.println();
//		bto.printPostOrder(root);System.out.println();
//		System.out.println(bto.searchInBinaryTree(root, 2));
//		System.out.println(bto.minValue(root));
//		System.out.println(bto.maxDepth(root));
//		System.out.println(bto.hasPathSum(root, 15));
//		bto.printPaths(root, new StringBuilder(""));
//		System.out.println(bto.findSuccessor(root, 5));
//		System.out.println(bto.findPredecessor(root, 6));
//		System.out.println(bto.LCA(bto.searchInBinaryTree(root, 4), bto.searchInBinaryTree(root, 6), root));
//		System.out.println(bto.LCAV2(bto.searchInBinaryTree(root, 4), bto.searchInBinaryTree(root, 6), root));
//		System.out.println(bto.secondMax(root).value);
//		System.out.println(bto.secondMaxV2(root).value);
//		bto.convertBinaryTreeToLinkedList(root);
//		System.out.println(bto.isBST(root));
//		bto.smallestKthNode(root, 5);
		bto.LCAV3(15, 9, root);
//		root = bto.prepareBinaryTreeFromSortedArrayWithGivenIndexasRoot(a,0,a.length-1,null,20);
//		bto.findMedian(root);
	}

	public Node prepareBinaryTreeFromSortedArray(int [] a, int begin, int end, Node parent) {
		//begin and end are the indexes indicates what part of array needs to be convrted in Binary Tree
		//equal values are going into right sub tree, not necessarily into right node
		Node root = null;
		if(a.length<=0 || begin>end || end>a.length-1)
			return null;
		if(end==begin) {
			root = new Node(a[begin],null,null);
			root.parent = parent;
			return root;
		}
		if(end==(begin+1)) {
			root = new Node(a[end],null,null);
			root.left = new Node(a[begin],null,null);
			root.parent = parent;
			root.left.parent = root;
			return root;
		}
		int mid = (end+begin)/2;
		root = new Node(a[mid],null,null);
		root.parent = parent;
		root.left = prepareBinaryTreeFromSortedArray(a,begin,mid-1,root);
		root.right = prepareBinaryTreeFromSortedArray(a,mid+1,end,root);
//		printInOrder(root);
		return root;
	}

	public Node prepareBinaryTreeFromSortedArrayWithGivenIndexasRoot(int [] a, int begin, int end, Node parent, int root_index) {
		//begin and end are the indexes indicates what part of array needs to be convrted in Binary Tree
		//equal values are going into right sub tree, not necessarily into right node
		Node root = null;
		if(a.length<=0 || begin>end || end>a.length-1)
			return null;
		if(end==begin) {
			root = new Node(a[begin],null,null);
			root.parent = parent;
			return root;
		}
		if(end==(begin+1)) {
			root = new Node(a[end],null,null);
			root.left = new Node(a[begin],null,null);
			root.parent = parent;
			root.left.parent = root;
			return root;
		}
		int mid = root_index;
		root = new Node(a[mid],null,null);
		root.parent = parent;
		root.left = prepareBinaryTreeFromSortedArrayWithGivenIndexasRoot(a,begin,mid-1,root,(begin+mid-1)/2);
		root.right = prepareBinaryTreeFromSortedArrayWithGivenIndexasRoot(a,mid+1,end,root,(mid+1+end)/2);
//		printInOrder(root);
		return root;
	}


	public Node convertBinaryTreeToLinkedList(Node root) {
		if(root==null)
			return null;
		if(root.left==null && root.right==null)
			return root;
		Node [] nodeArray = helperBinaryTreeToLinkedList(root);
		Node head = nodeArray[0];
		while(head!=null) {
			System.out.print(head.value+"->");
			head = head.right;
		}
		System.out.println();
		Node last = nodeArray[1];
		while(last!=null) {
			System.out.print(last.value+"->");
			last = last.left;
		}
		System.out.println();
		return nodeArray[0];
	}

	private Node[] helperBinaryTreeToLinkedList(Node root) {
		Node [] leftList = null;Node [] rightList = null;
		Node first1 = root; Node last = root;
		if(root.left!=null) {
			leftList = helperBinaryTreeToLinkedList(root.left);
		}
		if(leftList!=null) {
			first1 = leftList[0];
			last = leftList[1];
			last.right = root;
			root.left = last;
			last = root;
		}
		if(root.right!=null) {
			rightList = helperBinaryTreeToLinkedList(root.right);
		}
		if(rightList!=null) {
			last.right = rightList[0];
			rightList[0].left = last;
			last = rightList[1];
		}
		Node [] retArray = {first1, last};
		return retArray;
	}

	public boolean isBSTV2(Node root) {//incomplete
	//do in-order traversal of this BT and maintain only two elements you just visited recently
	//if these two elements do not follow less than relationship then its not a BST
		if(root!=null) {
			isBSTV2(root.left);
			System.out.println(root.value+",");
			isBSTV2(root.right);
		}
		return true;
	}

	private boolean isBSTV2Helper(Node root) {
		return true;
	}

	public void findMedian(Node root) {
		Node r = computerLRNode(root);
		int diff = r.LSTNodes-r.RSTNodes;
		while(Math.abs(diff)>1) {
			if(diff>0) {
				r = r.left;
				diff -= 2*(r.RSTNodes+1);
			} else {
				r = r.right;
				diff += 2*(r.LSTNodes+1);
			}
		}
		System.out.println(r.value);
	}

	private Node computerLRNode(Node root) {
		if(root!=null) {
			Node left = computerLRNode(root.left);
			Node right = computerLRNode(root.right);
			if(left!=null) {
				root.LSTNodes = left.LSTNodes+left.RSTNodes+1;
			} else {
				root.LSTNodes = 0;
			}
			if(right!=null) {
				root.RSTNodes = right.LSTNodes+right.RSTNodes+1;
			} else {
				root.RSTNodes = 0;
			}
			return root;
		}
		return null;
	}

	public boolean isBST(Node root) {
	//check that a given binary tree is Binary Search Tree
	//just checking the condition that left<root and root<right at all nodes will not be sufficient
	//because in BST (all nodes in left) < root and root < (all nodes in right)
		if(root==null)
			return true;
		if(root.left==null && root.right==null)
			return true;
		Object [] retArray = helperIsBST(root);
		System.out.println("min="+retArray[0]+" max="+retArray[1]+" "+retArray[2]);
		return ((Boolean)retArray[2]).booleanValue();
	}

	private Object[] helperIsBST(Node root) {
		Object[] leftArray = null;Object[] rightArray = null;
		Integer min = root.value; Integer max = root.value;
		Boolean isbst = true;
		if(root.left!=null) {
			if(root.left.value<=root.value) {
				isbst = isbst && Boolean.TRUE;
			} else {
				isbst = isbst && Boolean.FALSE;
			}
			if(isbst) {
				leftArray = helperIsBST(root.left);
			}
		}

		if(!isbst) {
			Object [] retArray = {min, max, Boolean.FALSE};
			return retArray;
		}


		if(root.right!=null) {
			if(root.value<root.right.value) {
				isbst = isbst && Boolean.TRUE;
			} else {
				isbst = isbst && Boolean.FALSE;
			}
			if(isbst) {
				rightArray = helperIsBST(root.right);
			}
		}

		if(!isbst) {
			Object [] retArray = {min, max, Boolean.FALSE};
			return retArray;
		}

		if(leftArray!=null) {
			if(!((Boolean)leftArray[2]).booleanValue()) {
				Object [] retArray = {min, max, Boolean.FALSE};
				return retArray;
			}
			if(((Integer)leftArray[1]).intValue()>root.value) {
				Object [] retArray = {min, max, Boolean.FALSE};
				return retArray;
			}
			min =  Math.min(root.value,((Integer)leftArray[0]).intValue());
			max =  Math.max(root.value,((Integer)leftArray[1]).intValue());
		}

		if(rightArray!=null) {
			if(!((Boolean)rightArray[2]).booleanValue()) {
				Object [] retArray = {min, max, Boolean.FALSE};
				return retArray;
			}
			if(((Integer)rightArray[0]).intValue()<=root.value) {
				Object [] retArray = {min, max, Boolean.FALSE};
				return retArray;
			}
			min =  Math.min(min,((Integer)rightArray[0]).intValue());
			max =  Math.max(max,((Integer)rightArray[1]).intValue());
		}

		Object [] retArray = {min, max, Boolean.TRUE};
		return retArray;
	}

	public void printInOrder(Node root) {
		if(root!=null) {
			printInOrder(root.left);
			System.out.print(root.value+",");
			printInOrder(root.right);
		}
	}

	public void smallestKthNode(Node root, int k) {//print the nth largest node in BST
		counter = k;
		helperSmallestKthNode(root);
	}

	private void helperSmallestKthNode(Node root) {//helper method
		if(root!=null) {
			helperSmallestKthNode(root.left);
//			System.out.println(root.value+","+(counter--));
			counter--;
			if(counter==0) {
				System.out.println(root.value);
			}
			helperSmallestKthNode(root.right);
		}
	}

	public void printReverseInOrder(Node root) { //incomplete, need to re-check
		if(root.left==null && root.right==null) {
			System.out.print(root.value+",");
			return;
		}
		if(root.left!=null && root.right==null) {
			printInOrder(root.left);
			System.out.print(root.value+",");
			return;
		}
		if(root.left==null && root.right!=null){
			System.out.print(root.value+",");
			printInOrder(root.right);
			return;
		}
		printReverseInOrder(root.right);
		System.out.print(root.value+",");
		printReverseInOrder(root.left);
	}

	public void printPostOrder(Node root) {
		if(root.left==null && root.right==null) {
			System.out.print(root.value+",");
			return;
		}
		if(root.left!=null && root.right==null) {
			printPostOrder(root.left);
			System.out.print(root.value+",");
			return;
		}
		if(root.left==null && root.right!=null){
			printPostOrder(root.right);
			System.out.print(root.value+",");
			return;
		}
		printPostOrder(root.left);
		printPostOrder(root.right);
		System.out.print(root.value+",");
	}

	public Node searchInBinaryTree(Node root, int value) {
		if(root==null)
			return null;
		if(root.value == value)
			return root;
		if(root.value > value)
			return searchInBinaryTree(root.left, value);
		return searchInBinaryTree(root.right, value);
	}

	public Node minValue(Node root) {
		if(root==null)
			return null;
		if(root.left==null)
			return root;
		return minValue(root.left);
	}

	public Node maxValue(Node root) {
		if(root==null)
			return null;
		if(root.right==null)
			return root;
		return maxValue(root.right);
	}

	public int maxDepth(Node root) {
		if(root==null)
			return 0;
		if(root.left==null && root.right==null)
			return 1;
		if(root.left==null && root.right!=null)
			return 1+maxDepth(root.right);
		if(root.right==null && root.left!=null)
			return 1+maxDepth(root.left);
		return 1+Math.max(maxDepth(root.left), maxDepth(root.right));
	}

	public boolean hasPathSum(Node root, int sum){
		//Given a binary tree and a sum, return true if the tree has a root-to-leaf path such that adding
		//up all the values along the path equals the given sum. Return false if no such path can be found.
		if(root==null)
			return false;
		if(root.value>sum)
			return false;
		if(root.left==null && root.right==null)
			return sum==root.value;
		int reduced = sum-root.value;
		if(root.left==null && root.right!=null)
			return hasPathSum(root.right, reduced);
		if(root.left!=null && root.right==null)
			return hasPathSum(root.left, reduced);
		boolean l = hasPathSum(root.left, reduced);
		boolean r = hasPathSum(root.right, reduced);
		return l || r;
	}

	public void printPaths(Node root, StringBuilder sb) {
		if(root==null)
			return;
		int before = 0; int after = 0;
		if(root.left==null && root.right==null) {
			before = sb.length();
			sb.append(root.value);
			after = sb.length();
			System.out.println(sb);
			sb.delete(sb.length()-after+before, sb.length());
			return;
		}
		before = sb.length();sb.append(root.value).append(",");after = sb.length();
		printPaths(root.left, sb);
		sb.delete(sb.length()-after+before, sb.length());before = sb.length();sb.append(root.value).append(",");after = sb.length();
		printPaths(root.right, sb);
		sb.delete(sb.length()-after+before, sb.length());
	}

	public int LCA(Node n1, Node n2, Node root) {
		//lowest common ancestor, assuming we have parent pointer at each node

		if(n1==n2){
			return n1.parent.value;
		}
		if(n1.value == n2.value) //both will be on the same line towards root
			return -1;
		if(n1==root || n2==root){
			return -1;
		}
		Node lca = n1.parent;Node ret = lca;
		if(n1.value < n2.value){
			while(lca.value>n1.value && lca.value<n2.value){
				ret = lca;
				lca = lca.parent;
			}
		}
		if(n1.value > n2.value) {
			while(lca.value<n1.value && lca.value>n2.value){
				ret = lca;
				lca = lca.parent;
			}
		}
		return ret.value;
	}

	public int LCAV2(Node n1, Node n2, Node root) {
		//lowest common ancestor, assuming we DON'T have parent pointer at each node
		if(n1==n2){
			return n1.parent.value;
		}
		if(n1.value == n2.value) //both will be on the same line towards root
			return -1;
		if(n1==root || n2==root){
			return -1;
		}
		Node lca = root;
		boolean b1 = lca.value>n1.value && lca.value>n2.value;
		boolean b2 = lca.value<n1.value && lca.value<n2.value;
		if(b1) {
			while(b1) {
				lca = lca.left;
				b1 = lca.value>n1.value && lca.value>n2.value;
			}
			return lca.value;
		}
		if(b2) {
			while(b2) {
				lca = lca.right;
				b2 = lca.value<n1.value && lca.value<n2.value;
			}
			return lca.value;
		}
		return root.value;
	}

	public boolean LCAV3(int n1, int n2, Node root) {//incomplete
	//This algorithm is for finding LCA in BT. We do DFS on BT, once we find n1, we are looking for n2 or
	//if we find n2, we are looking for n1. If we found both, we are done and the current root node
	//in recursive call will be LCA of n1 and n2.
		if(root==null)
			return false;

		if(root.value==n1) {
			return true;
		}
		if(root.value==n2) {
			return true;
		}
		boolean f1 = LCAV3(n1, n2, root.left);
		boolean f2 = LCAV3(n1, n2, root.right);

		if(f1&&f2) {
			System.out.println(root.value);
			return true;
		}
		return f1 || f2;
	}

	public boolean isBalanced(Node root) {//incomplete

		return true;
	}

	public Node findSuccessor(Node root, int k){
		Node n = root;
		while(n!=null){
			if(n.value<=k) {
				if(n.right==null)
					break;
				n = n.right;
			}
			else {
				if(n.left==null)
					break;
				n = n.left;
			}

		}
		if(n.value > k)
			return n;
		if(n.right==null) { //this node does not have any right sub tree and its value is lower than k
			while(n.parent!=null && n.parent.right==n){
				n = n.parent;
			}
			if(n.parent!=null && n.parent.left==n)
				return n.parent;
			else
				return null;
		}
		return null;
	}

	public Node findPredecessor(Node root, int k){
		Node n = root;
		while(n!=null){
			if(n.value>=k) {
				if(n.left==null)
					break;
				n = n.left;
			}
			else {
				if(n.right==null)
					break;
				n = n.right;
			}
		}
		if(n.value < k)
			return n;
		if(n.left == null) { //this node does not have any left sub tree and its value is greater than k
			while(n.parent!=null && n.parent.left==n){
				n = n.parent;
			}
			if(n.parent!=null && n.parent.right==n)
				return n.parent;
			else
				return null;
		}
		return null;
	}

	public Node secondMax(Node root) {
		if(root==null)
			return null;
		if(root.right==null && root.left==null)
			return null;
		if(root.right==null)
			return maxValue(root.left);
		Node max = maxValue(root.right);
		if(max.left!=null)
			return maxValue(max.left);
		return max.parent;
	}

	public Node secondMaxV2(Node root) {
		if(root==null)
			return null;
		if(root.right==null && root.left==null)
			return null;
		if(root.right==null)
			return maxValue(root.left);
		return findPredecessor(root, maxValue(root.right).value);
	}


}
