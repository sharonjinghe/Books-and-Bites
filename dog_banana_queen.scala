import scala.collection.mutable.ArrayBuffer

object BooksAndBites {
  //Object to store book and snacks data
  case class Book(title: String, author: String, isbn: String, publisher: String)
  case class Snack(name: String, flavor: String)

  //Create a list of books 
  val booksList = ArrayBuffer(
    Book("The Catcher in the Rye", "J.D. Salinger", "9780316769174", "Little, Brown and Company"), 
    Book("Harry Potter and the Sorcerer's Stone", "J.K. Rowling", "9781408855652", "Bloomsbury"), 
    Book("To Kill a Mockingbird", "Harper Lee", "9780446310789", "Harper Perennial Modern Classics")
  )

  //Create a list of snacks 
  val snacksList = ArrayBuffer(
    Snack("Chips", "Salt & Vinegar"), 
    Snack("Cookie", "Chocolate Chip"), 
    Snack("Popcorn", "Butter & Salt")
  )

  //Function to add books to the list
  def addBook(title: String, author:String, isbn:String, publisher:String): Unit = {
    booksList += Book(title, author, isbn, publisher)
  }

  //Function to add snacks to the list
  def addSnack(name: String, flavor: String): Unit = {
    snacksList += Snack(name, flavor)
  }

  //Function to remove books from the list
  def deleteBook(title: String): Unit = {
    booksList -= booksList.find(x => 
      x.title == title).getOrElse("Book doesn't exist")
  }

  //Function to remove snacks from the list
  def deleteSnack(name: String): Unit = {
    snacksList -= snacksList.find(x => 
      x.name == name).getOrElse("Snack doesn't exist")
  }

  //Function to print the book list
  def printBooks(): Unit = {
    booksList.foreach{book =>
      println("Title: " + book.title + " by " + book.author +
              "\nISBN: " + book.isbn + ", Publisher: " + book.publisher + "\n") 
    }
  }

  //Function to print the snack list
  def printSnacks(): Unit = {
    snacksList.foreach{snack =>
      println("Snack: " + snack.name + ", Flavor: " + snack.flavor + "\n") 
    }
  }
}