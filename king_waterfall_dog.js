//Books and Bites

//main library module
function Library (){
	this.books = []; //array of book objects;
	this.snacks = []; //array of snack objects
}

//prototype methods for library
Library.prototype.addBook = function (book){
	//adds a book object to library's books array
	this.books.push(book);
}

Library.prototype.addSnack = function (snack){
	//adds a snack object to library's snacks array
	this.snacks.push(snack);
}

Library.prototype.findBook = function (query){
	//returns a book object that matches the query
	var matchingBooks = this.books.filter(function(book){
		return book.title === query;
	});
	if (matchingBooks.length) {
		return matchingBooks[0];
	} else {
		return null;
	}
}

Library.prototype.findSnack = function (query){
	//returns a snack object that matches the query
	var matchingSnacks = this.snacks.filter(function(snack){
		return snack.name === query;
	});
	if (matchingSnacks.length) {
		return matchingSnacks[0];
	} else {
		return null;
	}
}

Library.prototype.checkoutBook = function (query){
	//removes a book object from the library's books array
	var matchingBooks = this.books.filter(function(book){
		return book.title === query;
	});
	if (matchingBooks.length) {
		this.books.splice(this.books.indexOf(matchingBooks[0]), 1);
		return matchingBooks[0];
	} else {
		return null;
	}
}

Library.prototype.checkoutSnack = function (query){
	//removes a snack object from the library's snacks array
	var matchingSnacks = this.snacks.filter(function(snack){
		return snack.name === query;
	});
	if (matchingSnacks.length) {
		this.snacks.splice(this.snacks.indexOf(matchingSnacks[0]), 1);
		return matchingSnacks[0];
	} else {
		return null;
	}
}

Library.prototype.returnBook = function (query){
	//adds a book object to library's books array
	this.books.push(query);
}

Library.prototype.returnSnack = function (query){
	//adds a snack object to library's snacks array
	this.snacks.push(query);
}

//book module
function Book (title, author, genre) {
	this.title = title;
	this.author = author;
	this.genre = genre;
	this.checkedOut = false;
}

//snack module

function Snack (name, calories) {
	this.name = name;
	this.calories = calories;
	this.checkedOut = false;
}

//user module

function User (name, books, snacks) {
	this.name = name;
	this.books = books;
	this.snacks = snacks;
}

User.prototype.checkoutBook = function (query, library){
	//checks out a book from the library's book array and adds it to user's books array
	var book = library.checkoutBook(query);
	if (book){
		this.books.push(book);
	}
	return book;
}

User.prototype.checkoutSnack = function (query, library){
	//checks out a snack from the library's snack array and adds it to user's snacks array
	var snack = library.checkoutSnack(query);
	if (snack){
		this.snacks.push(snack);
	}
	return snack;
}

User.prototype.returnBook = function (query, library){
	//returns a book to the library's book array and removes it from user's books array
	var bookIndex = this.books.indexOf(query);
	if (bookIndex !== -1) {
		this.books.splice(bookIndex, 1);
		library.returnBook(query);
	}
}

User.prototype.returnSnack = function (query, library){
	//returns a snack to the library's snack array and removes it from user's snacks array
	var snackIndex = this.snacks.indexOf(query);
	if (snackIndex !== -1) {
		this.snacks.splice(snackIndex, 1);
		library.returnSnack(query);
	}
}

//test

//create a new library
var library = new Library();

//add books to library
var book1 = new Book('The Cat in the Hat', 'Dr. Seuss', 'Childrens');
var book2 = new Book('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy');
var book3 = new Book('Life of Pi', 'Yann Martel', 'Realistic Fiction');
library.addBook(book1);
library.addBook(book2);
library.addBook(book3);

//add snacks to library
var snack1 = new Snack('Chips', 170);
var snack2 = new Snack('Candy', 85);
var snack3 = new Snack('Popcorn', 130);
library.addSnack(snack1);
library.addSnack(snack2);
library.addSnack(snack3);

//create user
var user = new User('John', [], []);

//user checks out book
var checkedOutBook = user.checkoutBook(book1.title, library);
console.log('John checked out ' + checkedOutBook.title + '.');

//user checks out snack
var checkedOutSnack = user.checkoutSnack(snack3.name, library);
console.log('John checked out ' + checkedOutSnack.name + '.');

//user returns book
user.returnBook(checkedOutBook, library);
console.log('John returned ' + checkedOutBook.title + ' to the library.')

//user returns snack
user.returnSnack(checkedOutSnack, library);
console.log('John returned ' + checkedOutSnack.name + ' to the library.')