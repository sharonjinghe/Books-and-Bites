package main

import (
	"fmt"
	"strings"
)

func main() {

// Book Struct
type Book struct {
	ISBN    string
	Title   string
	Subject string
	Author  string
}

// Bite Struct
type Bite struct {
	ID      string
	Name    string
	Taste   string
	Calorie int
}

// Initializing data
books := []Book{
	{
		ISBN:    "1",
		Title:   "Book One",
		Subject: "Thriller",
		Author:  "Author One",
	},
	{
		ISBN:    "2",
		Title:   "Book Two",
		Subject: "Romance",
		Author:  "Author Two",
	},
}

bites := []Bite{
	{
		ID:      "1",
		Name:    "Cupcake",
		Taste:   "Sweet",
		Calorie: 320,
	},
	{
		ID:      "2",
		Name:    "Chips",
		Taste:   "Salty",
		Calorie: 450,
	},
}

// List Books
fmt.Println("List of Books:")
for _, book := range books {
	fmt.Println(book.ISBN, book.Title, book.Subject, book.Author)
}
fmt.Println()

// Search Books
fmt.Println("Search Books:")
searchSubject := "Romance"
for _, book := range books {
	if strings.Contains(book.Subject, searchSubject) {
		fmt.Println(book.ISBN, book.Title, book.Subject, book.Author)
	}
}
fmt.Println()

// List Bites
fmt.Println("List of Bites:")
for _, bite := range bites {
	fmt.Println(bite.ID, bite.Name, bite.Taste, bite.Calorie)
}
fmt.Println()

// Search Bites
fmt.Println("Search Bites:")
searchTaste := "Sweet"
for _, bite := range bites {
	if strings.Contains(bite.Taste, searchTaste) {
		fmt.Println(bite.ID, bite.Name, bite.Taste, bite.Calorie)
	}
}
fmt.Println()

// Create Book
fmt.Println("Creating a Book...")
newBook := Book{
	ISBN:    "3",
	Title:   "Book Three",
	Subject: "Mystery",
	Author:  "Author Three",
}
books = append(books, newBook)
fmt.Println("Book Created!")
fmt.Println()

// Create Bite
fmt.Println("Creating a Bite...")
newBite := Bite{
	ID:      "3",
	Name:    "Cookies",
	Taste:   "Sweet",
	Calorie: 350,
}
bites = append(bites, newBite)
fmt.Println("Bite Created!")
fmt.Println()
}