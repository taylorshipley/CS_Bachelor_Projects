/**
 * Node.java - Fundamental OOP node example.
 * @author: @professorgordon
 * @url: http://johngordon.io/javaadvancednodes.php
 * @license: Creative Commons. No Warranty. No Liability.
 * @disclaimer: This code file is intended strictly for
 *              academic purposes. It is NOT intended for
 *              use in production systems.
 */
package week6;
enum PlayerType 
{
	Warlock,
	Thief,
	Sorcerer,
	Warrior,
	Monk,
	Witch,
	Ranger,
	Druid,
	Paladin,
	Cleric
}

public class PlayerNode
{
    PlayerNode next;
    int playerID;
    String firstName;
    String lastName;
    String playerName;
    PlayerType playerType;
    double lifePoints;
    int totalScore;
	public PlayerNode(PlayerNode next, int playerID, String firstName, String lastName, String playerName,
			PlayerType playerType, double lifePoints, int totalScore) 
	{
		this.next = next;
		this.playerID = playerID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.playerName = playerName;
		this.playerType = playerType;
		this.lifePoints = lifePoints;
		this.totalScore = totalScore;
	}   
}