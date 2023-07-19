%Books and Bites

%Initialization
clear all 
close all
clc

%Define Variables
books = {'The Catcher in the Rye', 'The Great Gatsby', 'To Kill a Mockingbird', 'Pride & Prejudice'};
bites = {'cookies', 'cupcakes', 'pie', 'candy'};

%Loop through books
for i = 1:length(books)
    %Print title and author
    fprintf('Book: %s\n', books{i});
    %Loop through bites
    for j = 1:length(bites)
        %Print out combinations
        fprintf('\t%s and %s\n', books{i}, bites{j});
    end
end

%Make plot
figure
hold on
title('Books vs Bites');
xlabel('Books');
ylabel('Bites');

%Loop through books
for i = 1:length(books)
    %Plot book
    plot(i*ones(size(bites)), 1:length(bites));
    %Plot bites
    plot(1:length(books), i*ones(size(bites)));
end

%Label plot
xTicks = cellfun(@(x)strrep(x, ' & ', '\&'), books, 'UniformOutput', false);
set(gca, 'XTick', 1:length(books), 'XTickLabel', xTicks);
yTicks = bites;
set(gca, 'YTick', 1:length(bites), 'YTickLabel', yTicks);

%Finish
hold off