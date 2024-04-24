/**
 * LinkedListDemo1.java - Program to demonstrate use of the
 *                        LinkedList and Node classes.
 * @author: @professorgordon, @author Taylor Shipley
 * @url: http://johngordon.io/javaadvancedlinkedlists1.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 */
package week5;

import java.util.Scanner;

public class LinkedListDemo1 
{

	public static void main(String[] args)

	{
		Scanner scan = new Scanner(System.in);
		LinkedList ll = new LinkedList();
		ll.append(2);
		ll.append(4);
		ll.append(6);
		ll.append(8);
		ll.append(10);
		ll.printList();
		
		System.out.println("Enter new head node value: ");
		int newHead = scan.nextInt();
		ll.prepend(newHead);
		ll.printList();
		
		System.out.println("Enter Node to search for: ");
		
		int data = scan.nextInt();
		if (ll.search(data) == -1)
		{
			System.out.println("Value was not found");
		}
		else
		{
			System.out.println("Value was found at node: " + ll.search(data));
		}
		
		System.out.println("Enter value of node to be deleted: ");
		int deleteValue = scan.nextInt();
		ll.deleteNode(deleteValue);
		System.out.println("Node was deleted\n");
		ll.printList();
		
		System.out.println("Linked list length is " + ll.length());
		scan.close();
	}
	
}
