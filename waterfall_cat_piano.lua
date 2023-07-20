--Book and Bites--

--Declare Global Variables--
local books = {}
local bites = {}
local totalBooks = 0
local totalBites = 0

--Function to add a book--
function addBook(book)
	table.insert(books, book)
	totalBooks = totalBooks + 1
end

--Function to add a bite--
function addBite(bite)
	table.insert(bites, bite)
	totalBites = totalBites + 1
end

--Function to delete a book--
function deleteBook(book)
	for i, b in ipairs(books) do
		if b == book then
			table.remove(books, i)
			totalBooks = totalBooks - 1
			return true
		end
	end
	return false
end

--Function to delete a bite--
function deleteBite(bite)
	for i, b in ipairs(bites) do
		if b == bite then
			table.remove(bites, i)
			totalBites = totalBites - 1
			return true
		end
	end
	return false
end

--Function to get all books--
function getAllBooks()
	return books
end

--Function to get all bites--
function getAllBites()
	return bites
end

--Function to get the total number of books--
function getTotalBooks()
	return totalBooks
end

--Function to get the total number of bites--
function getTotalBites()
	return totalBites
end

--Function to print all books--
function printAllBooks()
	for i, book in ipairs(books) do
		print('Book' .. i .. ': ' .. book)
	end
end

--Function to print all bites--
function printAllBites()
	for i, bite in ipairs(bites) do
		print('Bite' .. i .. ': ' .. bite)
	end
end

--Function to save book and bite data to a file--
function saveDataToFile(filename)
	--Create the file handle
	local file = io.open(filename, 'w')
	if not file then
		return false
	end

	--Save the books
	file:write('Books:\n')
	for i, book in ipairs(books) do
		file:write('Book' .. i .. ': ' .. book .. '\n')
	end

	--Save the bites
	file:write('\nBites:\n')
	for i, bite in ipairs(bites) do
		file:write('Bite' .. i .. ': ' .. bite .. '\n')
	end

	--Close the file handle
	file:close()

	--Success
	return true
end

--Function to load book and bite data from a file--
function loadDataFromFile(filename)
	--Create the file handle
	local file = io.open(filename, 'r')
	if not file then
		return false
	end

	--Read the books
	local booksStr = file:read('*all')
	local bookStart, bookEnd = string.find(booksStr, 'Books:')
	local booksStr = string.sub(booksStr, bookStart + 7)
	
	--Read the bites
	local bitesStr = file:read('*all')
	local biteStart, biteEnd = string.find(bitesStr, 'Bites:')
	local bitesStr = string.sub(bitesStr, biteStart + 7)

	--Close the file handle
	file:close()

	--Load the books
	for book in string.gmatch(booksStr, "Book%d+: ([^\n]+)") do
		table.insert(books, book)
		totalBooks = totalBooks + 1
	end

	--Load the bites
	for bite in string.gmatch(bitesStr, "Bite%d+: ([^\n]+)") do
		table.insert(bites, bite)
		totalBites = totalBites + 1
	end

	--Success
	return true
end

--Function to print all books and bites--
function printAll()
	print('Books:')
	printAllBooks()
	print('\nBites:')
	printAllBites()
end

--Function to print a message--
function printMessage(message)
	print(message)
end

--Function to execute a command--
function executeCommand(command)
	--Split the command into tokens
	local commandTable = {}
	for word in string.gmatch(command, "[^%s]+") do
		table.insert(commandTable, word)
	end

	--Execute the command
	local command = commandTable[1]
	if command == 'addBook' then
		addBook(commandTable[2])
	elseif command == 'addBite' then
		addBite(commandTable[2])
	elseif command == 'deleteBook' then
		deleteBook(commandTable[2])
	elseif command == 'deleteBite' then
		deleteBite(commandTable[2])
	elseif command == 'getAllBooks' then
		getAllBooks()
	elseif command == 'getAllBites' then
		getAllBites()
	elseif command == 'printAllBooks' then
		printAllBooks()
	elseif command == 'printAllBites' then
		printAllBites()
	elseif command == 'printAll' then
		printAll()
	elseif command == 'printMessage' then
		printMessage(commandTable[2])
	elseif command == 'saveDataToFile' then
		saveDataToFile(commandTable[2])
	elseif command == 'loadDataFromFile' then
		loadDataFromFile(commandTable[2])
	end
end