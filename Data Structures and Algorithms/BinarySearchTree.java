package week9;
/*
 * BinarySearchTree.java - Class to manage binary search 
 *                         tree implementations.
 * 
 * @author: @professorgordon
 * @url: http://johngordon.io/javaadvancedtrees.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 *
 */

public class BinarySearchTree 
{
	public BSTNode root;
	public int BSTDepth = 0;

	public void insert(int data)
	{
		BSTNode newNode = new BSTNode(data);  
		if(root == null)
		{  
			root = newNode;  
			return;  
		}  
		else
		{  
			BSTNode current = root, parent = null;  
			while(true) 
			{  
				parent = current;  
				if(data < current.data)
				{  
					current = current.left;  
					if(current == null)
					{  
						parent.left = newNode;  
						return;  
					}  
				}  
				else
				{  
					current = current.right;  
					if(current == null)
					{  
						parent.right = newNode;  
						return;  
					}  
				}  
			}  
		}  
	}

	public void preOrderTraverse(BSTNode n)
	{  
		if(root == null)
		{  
			System.out.println("Tree is empty");  
			return;  
		}  
		else
		{  
			System.out.print(n.data + " ");  
			if(n.left!= null)
			{
				preOrderTraverse(n.left);  
			}
			if(n.right!= null)
			{
				preOrderTraverse(n.right);  
			}
		}  
	}  

	public void inOrderTraverse(BSTNode n)
	{  
		if(root == null)
		{  
			System.out.println("Tree is empty");  
			return;  
		}  
		else
		{  
			if(n.left!= null)
			{
				inOrderTraverse(n.left);  
			}
			System.out.print(n.data + " ");  
			if(n.right!= null)
			{
				inOrderTraverse(n.right);  
			}
		}  
	}  

	public void postOrderTraverse(BSTNode n)
	{  
		if(root == null)
		{  
			System.out.println("Tree is empty");  
			return;  
		}  
		else
		{  
			if(n.left!= null)
			{
				postOrderTraverse(n.left);  
			}
			if(n.right!= null)
			{
				postOrderTraverse(n.right);  
			}
			System.out.print(n.data + " ");  
		}  
	}

	public BSTNode searchRecursive(BSTNode n, int data)
	{
	    if (n == null || n.data == data)
	    {
	    	return n;
	    }
	    if (n.data < data)
	    {
	       return searchRecursive(n.right, data);
	    }
	    return searchRecursive(n.left, data);
	}

	
	public BSTNode searchIterative(BSTNode n, int data)
	{
		while (n != null && data != n.data)
		{
			if (data < n.data)
			{
				n = n.left;
			}
			else
			{
				n = n.right;
			}
		}
		return n;
	}
	
	public int depth(BSTNode n)
	{
		if (n == null)
		{
			return 0;
		}
		else
		{
			int left = depth(n.left);
			int right = depth(n.right);
			return Math.max(left, right) + 1;
		}
	}

	public void treeDepth(BSTNode n, int counter)
	{
		if (n == null)
		{
			return;
		}
		if (n.left == null && n.right == null)
		{
			this.BSTDepth = Math.max(BSTDepth, counter);
		}
		treeDepth(n.left, counter + 1);
		treeDepth(n.right, counter + 1);
	}


	
	public static BSTNode delete(BSTNode n, int data) 
	{
        if(n == null) return n;
        if(data > n.data)
        {
        	// Traverse right
            n.right = delete(n.right, data);
        }
        else if(data < n.data)
        {
        	// Traverse left
            n.left = delete(n.left, data);
        }
        else
        {
        	// Found the node
            if(n.left == null && n.right == null)
            {
            	// It is a leaf, set it to null (delete it)
                n = null;
            }
            else if(n.right != null)
            {
            	// It has a right-child, get the successor 
                n.data = getSuccessor(n);
                n.right = delete(n.right, n.data);
            }
            else
            {
            	// No successor so go back
                n.data = getPredecessor(n);
                n.left = delete(n.left, n.data);
            }
        }
        return n;
    }
	
	
    private static int getSuccessor(BSTNode n){
        n = n.right;
        while(n.left != null){
            n = n.left;
        }
        return n.data;
    }
	
    private static int getPredecessor(BSTNode n){
        n = n.left;
        while(n.right != null){
            n = n.right;
        }
        return n.data;
    }    
    
}
