package main;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		System.out.println("Hello there");
		System.out.print("Do you want to train the model? [y/n]: ");
		Scanner in = new Scanner(System.in);
        String s = in.nextLine();
        System.out.println("you selected " + s);
        in.close();
        
	}

}
