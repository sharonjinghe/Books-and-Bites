import java.util.ArrayList;
import java.util.List;

public class BooksAndBites {
	
	public static void main(String[] args) {

		// Create a list of books
		List<String> books = new ArrayList<String>();
		books.add("The Hobbit");
		books.add("The Lord of the Rings");
		books.add("Harry Potter");
		books.add("To Kill a Mockingbird");
		books.add("Pride and Prejudice");
		
		// Create a list of snacks
		List<String> snacks = new ArrayList<String>();
		snacks.add("Chips");
		snacks.add("Cookies");
		snacks.add("Popcorn");
		snacks.add("Fruit");
		snacks.add("Cheese");
		
		// Loop through the list of books and print each one
		for (String book : books) {
			System.out.println("Reading " + book);
		}
		
		// Loop through the list of snacks and print each one
		for (String snack : snacks) {
			System.out.println("Eating " + snack);
		}
		
		// Create a function to mix the books and snacks
		public static void mixBooksAndSnacks(List<String> b, List<String> s) {
			for (String book : b) {
				for (String snack : s) {
					System.out.println("Reading " + book + " with " + snack);
				}
			}
		}
		
		// Call the mixBooksAndSnacks function
		mixBooksAndSnacks(books, snacks);
		
	}
	
}