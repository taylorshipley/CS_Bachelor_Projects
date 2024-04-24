/**
* @Author: Taylor Shipley
* @Class: CS2130
* @Program: 11
* @Name: Relations: Properties and Closures
* @Desc: Demonstrates the properties of relations and the operations we can perform on them using Boolean matrices.
* @Version:  1.0
* @Date: 11/29/2022
*/

package prog11;

import java.util.Scanner;

public class Relations {
	static Scanner input = new Scanner(System.in);
	static int size = 4;

	public static void main(String[] args) {
		final int[][] arrayA = { { 0, 1, 0, 0 }, { 0, 0, 1, 0, }, { 0, 0, 0, 1 }, { 1, 0, 0, 0 } };
		// readIn();
		System.out.println("Array A =");
		printArr(arrayA);
		

		int[][] arrayB = { { 0, 0, 1, 0 }, { 0, 0, 0, 1, }, { 1, 0, 0, 0 }, { 0, 1, 0, 0 } };
		// readIn();
		System.out.println("Array B =");
		printArr(arrayB);

		System.out.println("The meet of A and B:");
		printArr(meet(arrayA, arrayB));

		System.out.println("The join of A and B:");
		printArr(join(arrayA, arrayB));

		System.out.println("The Boolean product of A and B:");
		printArr(booProduct(arrayA, arrayB));

		System.out.println("The complement of A");
		printArr(complement(arrayA));

		System.out.println("The transpose of A");
		printArr(transpose(arrayA));

		System.out.println("Relation A is reflexive: ");
		System.out.println(String.valueOf(isRef(arrayA)) + "\n");
		
		System.out.println("Relation A is symmetric: ");
		System.out.println(String.valueOf(isSymm(arrayA)) + "\n");
		
		System.out.println("Relation A is antisymmetric: ");
		System.out.println(String.valueOf(isAntiSymm(arrayA)) + "\n");
		
		System.out.println("Relation A is transitive: ");
		System.out.println(String.valueOf(isTrans(arrayA)) + "\n");

		System.out.println("The reflexive closure of A");
		printArr(refClosure(arrayA));
		
		System.out.println("The symmetric closure of A");
		printArr(symmClosure(arrayA));
		
		System.out.println("The transitive closure of A");
		printArr(transClosure(arrayA));
	}

	public static int[][] readIn() {
		System.out.println("You may have up to a 10x10 matrix, entered as a set of ordered pairs one\n"
				+ "ordered pair per line. For example, 1 3 results in a 1 in row 1, column 3.\n"
				+ "Please enter the matrix as ordered pairs x y (0 0 to end matrix input)");
		size = 0;
		int[][] arr2D = new int[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				arr2D[i][j] = 0;
			}
		}
		int x = 1;
		int y = 1;
		do {
			String tempXY = input.nextLine();
			String[] splitXY = tempXY.split("\\s+");
			int tempX = Integer.parseInt(splitXY[0]);
			int tempY = Integer.parseInt(splitXY[1]);
			if (tempX < 0 || tempX > 10) {
				System.out.println("Try Again. X must be between 0-10.");
			} else
				x = tempX;
			if (tempY < 0 || tempY > 10) {
				System.out.println("Try Again. Y must be between 0-10.");
			} else
				y = tempY;
			if (x > 0 && y > 0) {
				arr2D[x - 1][y - 1] = 1;
			}
			if (size < x) {
				size = x;
			}
			if (size < y) {
				size = y;
			}
		} while (x != 0 || y != 0);
		System.out.println();
		return arr2D;
	}

	public static void printArr(int[][] arr2D) {
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				System.out.print(arr2D[i][j] + " ");
			}
			System.out.println();
		}
		System.out.println();
	}

	private static int[][] meet(int[][] arrayA, int[][] arrayB) {
		int[][] arrayC = new int[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				arrayC[i][j] = 0;
			}
		}
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayA[i][j] == 1 && arrayB[i][j] == 1) {
					arrayC[i][j] = 1;
				}
			}
		}
		return arrayC;

	}

	private static int[][] join(int[][] arrayA, int[][] arrayB) {
		int[][] arrayC = new int[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				arrayC[i][j] = 0;
			}
		}
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayA[i][j] == 1 || arrayB[i][j] == 1) {
					arrayC[i][j] = 1;
				}
			}
		}
		return arrayC;

	}

	private static int[][] booProduct(int[][] arrayA, int[][] arrayB) {
		int[][] arrayC = new int[size][size];
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				arrayC[i][j] = 0;
			}
		}
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				for (int k = 0; k < size; k++) {
					arrayC[i][j] += arrayA[i][k] * arrayB[k][j];

				}
			}
		}
		return arrayC;
	}

	private static int[][] complement(int[][] arrayA) {
		int[][] arrayC = new int[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				arrayC[i][j] = 0;
			}
		}
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayA[i][j] == 0)
					arrayC[i][j] = 1;
			}
		}
		return arrayC;

	}

	private static int[][] transpose(int[][] arrayA) {
		int[][] arrayC = new int[10][10];
		for (int i = 0; i < 10; i++) {
			for (int j = 0; j < 10; j++) {
				arrayC[i][j] = 0;
			}
		}
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				arrayC[j][i] = arrayA[i][j];
			}
		}
		return arrayC;

	}

	private static boolean isRef(int[][] arrayA) {
		boolean isRef = true;
		for (int i = 0; i < size; i++) {
			if (arrayA[i][i] == 0)
				isRef = false;
		}
		return isRef;
	}

	private static boolean isSymm(int[][] arrayA) {
		boolean isSymm = true;
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayA[i][j] != arrayA[j][i])
					isSymm = false;
			}
		}
		return isSymm;
	}

	private static boolean isAntiSymm(int[][] arrayA) {
		boolean isAntiSymm = true;
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (i != j && arrayA[i][j] == 1 && arrayA[j][i] == 1)
					isAntiSymm = false;
			}
		}
		return isAntiSymm;
	}

	private static boolean isTrans(int[][] arrayA) {
		boolean isTrans = true;
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayA[i][j] == 1) {
					for (int k = 0; k < size; k++) {
						if (arrayA[j][k] == 1 && arrayA[i][k] == 0)
							isTrans = false;
					}
				}
			}
		}
		return isTrans;
	}

	private static int[][] refClosure(int[][] arrayA) {
		int[][] arrayC = new int[size][size];
		for(int i = 0; i<size; i++) 
		{
			for(int z = 0; z<size; z++) 
			{
				arrayC[i][z] = arrayA[i][z];
			}
		}
		for (int i = 0; i < size; i++) {
			arrayC[i][i] = 1;
		}
		return arrayC;
	}

	private static int[][] symmClosure(int[][] arrayA) {
		int[][] arrayC = arrayA.clone();
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				if (arrayC[i][j] == 1) {
					arrayC[j][i] = 1;
				}
			}
		}
		return arrayC;

	}

	private static int[][] transClosure(int[][] arrayA) {
		int[][] arrayW = arrayA.clone();
		for (int k = 0; k < size; k++) {
			for (int i = 0; i < size; i++) {
				for (int j = 0; j < size; j++) {
					if (arrayW[i][j] == 1 || (arrayW[i][k] == 1 && arrayW[k][i] == 1))
						arrayW[i][j] = 1;
				}
			}
		}
		return arrayW;
	}
}
