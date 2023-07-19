% Code to 'Books and Bites'

% Initialize program
clc;
clear all;

% Declare variables
numBooks = 0;
numBites = 0;
total_time = 0;

% Prompt user for number of books to read
numBooks = input('How many books do you want to read?: ');

% Prompt user for number of bites to eat
numBites = input('How many bites do you want to eat?: ');

% Calculate total reading time in minutes
total_time = numBooks * 60 + numBites * 5;

% Display total reading time in minutes
disp(['Total reading time is ' num2str(total_time) ' minutes'])

% Calculate total reading time in hours
total_time_hrs = total_time/60;

% Display total reading time in hours
disp(['Total reading time is ' num2str(total_time_hrs) ' hours'])

% Initialize book counter
book_cnt = 0;

% Initialize bite counter
bite_cnt = 0;

% Display progress
disp('Progress: ')

% Loop while book counter is less than number of books
while book_cnt < numBooks
    
    % Increment book counter
    book_cnt = book_cnt + 1;
    
    % Display book count
    disp(['Book #' num2str(book_cnt) ' read'])
    
    % Loop while bite counter is less than number of bites
    while bite_cnt < numBites
        
        % Increment bite counter
        bite_cnt = bite_cnt + 1;
        
        % Display bite count
        disp(['Bite #' num2str(bite_cnt) ' eaten'])
        
    end
    
end

% Display success message
disp('All books and bites are complete!')