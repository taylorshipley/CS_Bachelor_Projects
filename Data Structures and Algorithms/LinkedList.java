/**
 * LinkedList.java - Class to manage LinkedLists.
 * @author: @professorgordon
 * @url: http://johngordon.io/javaadvancedlinkedlists1.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 */
package week5;

public class LinkedList 
{

	Node head;
	
	public void append(int data)
	{
		if (head == null)
		{
			head = new Node(data);
			return;
		}
		Node current = head;
		while (current.next != null)
		{
			current = current.next;
		}
		current.next = new Node(data);
	}
	
	public void prepend(int data)
	{
		if (head == null)
		{
			head = new Node(data);
			return;
		}
		Node newNode = new Node(data);
		newNode.next = head;
		head = newNode;
	}
	
	public int search(int data)
	{
		Node temp = head;
		boolean found = false;
		int position = 0;
		while (temp.next != null && found == false)
		{
			position++;
			if (temp.data == data)
			{
				found = true;
			}
			temp = temp.next;
		}
		if(found == true)
		{
			return position;
		}
		else
		{
			return -1;
		}
		
	}
	
	void deleteNode(int data)
    {
        Node temp = head, prev = null;
        if (temp != null && temp.data == data)
        {
            head = temp.next;
            return;
        }
        while (temp != null && temp.data != data) 
        {
            prev = temp;
            temp = temp.next;
        }
        if (temp == null)
            return;

        prev.next = temp.next;
    }
	
	public void printList()
	{
		Node current = head;
		System.out.print("List Contents: ");
		while (current != null)
		{
			System.out.print(current.data + " -> ");
			current = current.next;
		}
		System.out.println("null");
	}
	public int length()
	{
		int length = 1;
		while (head.next != null)
		{
			length++;
			head = head.next;
		}
		return length;
	}

}
