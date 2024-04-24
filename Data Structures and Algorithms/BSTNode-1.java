package week9;
/*
 * BSTNode.java - Binary Search Tree node class.
 * 
 * @author: @professorgordon
 * @url: http://johngordon.io/javaadvancedtrees.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 *
 */

public class BSTNode 
{

	int data;
	BSTNode left;
	BSTNode right;
	String userName;

	public BSTNode(int data) 
	{
		this.data = data;
	}
	public BSTNode(int data, String userName) 
	{
		this.data = data;
		this.userName = userName;
	}
	
}
