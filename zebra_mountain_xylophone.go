package main

import "fmt"

// BooksAndBites is a basic struct designed to store information about a book and its associated snack
type BooksAndBites struct {
	Book string
	Snack string
}

func main() {
	// Create a list of favorite books and snacks
	booksAndBites := []BooksAndBites{
		{"The Great Gatsby", "Popcorn"},
		{"The Catcher in the Rye", "Chocolate Chip Cookies"},
		{"The Grapes of Wrath", "Chips"},
		{"To Kill a Mockingbird", "Peanuts"},
		{"In Cold Blood", "Pretzels"},
	}

	for _, b := range booksAndBites {
		fmt.Printf("The book '%s' goes great with a %s!\n", b.Book, b.Snack)
	}
	
	// Create a function to print all book and snack combinations
	printBooksAndBites := func(ba []BooksAndBites) {
		for _, b := range ba {
			fmt.Printf("Reading '%s'? Grab a %s for a snack!\n", b.Book, b.Snack)
		}
	}

	// Create a function to add a new book and snack combination
	addBooksAndBites := func(ba []BooksAndBites, b BooksAndBites) []BooksAndBites {
		ba = append(ba, b)
		return ba
	}

	// Create a function to remove a book and snack combination
	removeBooksAndBites := func(ba []BooksAndBites, b BooksAndBites) []BooksAndBites {
		for i, v := range ba {
			if v == b {
				ba = append(ba[:i], ba[i+1:]...)
				break
			}
		}
		return ba
	}

	// Prints the initial list of books and snacks
	printBooksAndBites(booksAndBites)
	
	// Create a new books and bites combination
	newBookandBite := BooksAndBites{"The Cat In The Hat", "Cheese and Crackers"}

	// Adds a new books and bites combination
	booksAndBites = addBooksAndBites(booksAndBites, newBookandBite)
	
	// Prints the updated list of books and snacks
	printBooksAndBites(booksAndBites)

	// Removes a books and bites combination from the list
	booksAndBites = removeBooksAndBites(booksAndBites, newBookandBite)

	// Prints the updated list of books and snacks
	printBooksAndBites(booksAndBites)

}