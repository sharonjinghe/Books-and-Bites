#Creating data frame for Books and Bites
Books_and_Bites <- data.frame(
  Book_title = character(),
  Retail_price = numeric(),
  Bite_name = character(),
  Bite_description = character(),
  Bite_price = numeric()
)

#Populating the data frame
Books_and_Bites <- rbind(
  Books_and_Bites,
  data.frame(Book_title="Harry Potter and the Philosopher's Stone",
             Retail_price=29.99, 
             Bite_name="Butterbeer", 
             Bite_description="Creamy, sweet, and non-alcoholic drink", 
             Bite_price=6.99),
  data.frame(Book_title="The Catcher in the Rye",
             Retail_price=29.99, 
             Bite_name = "Hamburger", 
             Bite_description = "Classic all-beef patty on a sesame bun with lettuce, tomato, and onion", 
             Bite_price=7.99),
  data.frame(Book_title="Pride and Prejudice",
             Retail_price=27.99, 
             Bite_name="Pot pie", 
             Bite_description="Savory pastry filled with vegetables and chicken", 
             Bite_price=7.99),
  data.frame(Book_title="To Kill a Mockingbird",
             Retail_price=27.99, 
             Bite_name="Fried Green Tomatoes", 
             Bite_description="Thick slices of green tomatoes dredged in cornmeal and fried", 
             Bite_price=6.99),
  data.frame(Book_title="The Great Gatsby",
             Retail_price=29.99, 
             Bite_name="Cobb Salad", 
             Bite_description="Romaine lettuce, crispy bacon, hard-boiled eggs, tomatoes, and blue cheese dressing", 
             Bite_price=7.99)
)

#Data frame manipulation
row.names(Books_and_Bites) <- gsub(' ', '_', as.character(Books_and_Bites$Book_title))

#Create the "total price" column
Books_and_Bites$Total_price <- Books_and_Bites$Retail_price + Books_and_Bites$Bite_price

#Sort data frame
Books_and_Bites <- Books_and_Bites[order(Books_and_Bites$Book_title),]

#Create the "Discount" column
Books_and_Bites$Discount <- Books_and_Bites$Retail_price - (Books_and_Bites$Retail_price * 0.10)

#Create a summary data frame
Books_and_Bites_Summary <- aggregate(. ~Book_title, Books_and_Bites, sum)

#Remove the unnecessary columns
Books_and_Bites_Summary <- Books_and_Bites_Summary[-c(3, 5)]

#Rename the columns
colnames(Books_and_Bites_Summary) <- c("Book_title", "Total_price")

#Calculate the "Discounted price"
Books_and_Bites_Summary$Discounted_price <- Books_and_Bites_Summary$Total_price - (Books_and_Bites_Summary$Total_price * 0.10)

#Create function to format currency
format_currency <- function(x){
  dollar_sign <- "\u0024"
  paste0(dollar_sign, format(x, nsmall=2))
}

#Apply the function
Books_and_Bites$Retail_price <- format_currency(Books_and_Bites$Retail_price)
Books_and_Bites$Bite_price <- format_currency(Books_and_Bites$Bite_price)
Books_and_Bites$Total_price <- format_currency(Books_and_Bites$Total_price)
Books_and_Bites$Discount <- format_currency(Books_and_Bites$Discount)
Books_and_Bites_Summary$Total_price <- format_currency(Books_and_Bites_Summary$Total_price)
Books_and_Bites_Summary$Discounted_price <- format_currency(Books_and_Bites_Summary$Discounted_price)

#Print table
print(Books_and_Bites, row.names = F)

#Print summary table
print(Books_and_Bites_Summary, row.names = F)