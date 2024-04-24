package week9;

import java.util.Random;

/*
 * BSTDemo.java - Class to demonstrate a binary search tree.
 * 
 * @author: @professorgordon
 * @url: http://johngordon.io/javaadvancedtrees.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 *
 **/

public class BSTDemo 
{
	static int nodeAmount = 10000000;
	public static void main(String[] args) 
	{
		BinarySearchTree bst = new BinarySearchTree();
		// Sample Data: 20, 33, 18, 19, 46, 29, 4, 62
		bst.insert(20);
		bst.insert(33);
		bst.insert(18);
		bst.insert(19);
		bst.insert(46);
		bst.insert(29);
		bst.insert(4);
		bst.insert(62);
		System.out.print("PreOrder Traverse:\t");
		bst.preOrderTraverse(bst.root);
		System.out.println();
		System.out.print("InOrder Traverse:\t");
		bst.inOrderTraverse(bst.root);
		System.out.println();
		System.out.print("PostOrder Traverse:\t");
		bst.postOrderTraverse(bst.root);
		System.out.println();
		System.out.print("Binary Tree Depth:\t");
		System.out.println(bst.depth(bst.root));
		
		System.out.println();
		
		long startTime = System.currentTimeMillis()/ 1000;
		BinarySearchTree bst2 = new BinarySearchTree();
		randBST(bst2);

		long endTime = System.currentTimeMillis()/ 1000;
		System.out.println("That took " + (endTime - startTime) + " seconds");
		
	}

	private static void randBST(BinarySearchTree tree) 
	{
		Random random = new Random();
		
		for (int i = 0; i<nodeAmount; i++)
		{
			int randNode = random.nextInt(100) + 1;
			tree.insert(randNode);
		}
	}
}
