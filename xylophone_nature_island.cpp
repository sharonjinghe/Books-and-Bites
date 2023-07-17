#include <iostream> 
#include <string> 

using namespace std; 

class Book { 
    string title;
    string author; 
    int pages; 
public: 
    Book(string _title, string _author, int _pages) { 
        title = _title; 
        author = _author; 
        pages = _pages; 
    }

    void setTitle(string _title) { 
        title = _title; 
    } 
  
    void setAuthor(string _author) { 
        author = _author; 
    } 
  
    void setPages(int _pages) { 
        pages = _pages; 
    } 

    string getTitle() { 
        return title; 
    } 

    string getAuthor() { 
        return author; 
    } 

    int getPages() { 
        return pages; 
    } 

    void print() { 
        cout << "Title: " << title << "\n"; 
        cout << "Author: " << author << "\n"; 
        cout << "Pages: " << pages << "\n"; 
    } 
};

class Bites { 
    string name; 
    string flavor; 
    int calories; 
public: 
    Bites(string _name, string _flavor, int _calories) { 
        name = _name; 
        flavor = _flavor; 
        calories = _calories; 
    } 

    void setName(string _name) { 
        name = _name; 
    } 

    void setFlavor(string _flavor) { 
        flavor = _flavor; 
    } 

    void setCalories(int _calories) {
        calories = _calories; 
    } 

    string getName() { 
        return name; 
    } 

    string getFlavor() { 
        return flavor; 
    } 

    int getCalories() { 
        return calories; 
    } 

    void print() { 
        cout << "Name: " << name << "\n"; 
        cout << "Flavor: " << flavor << "\n"; 
        cout << "Calories: " << calories << "\n"; 
    } 
}; 

int main() { 
    Book b1("To Kill a Mockingbird", "Harper Lee", 281); 
    b1.print(); 
    cout << "\n"; 

    Bites b2("Tortilla Chips", "Salted", 500); 
    b2.print(); 
    cout << "\n"; 

    return 0; 
}