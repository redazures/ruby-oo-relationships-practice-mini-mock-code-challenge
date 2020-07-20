require 'pry'
require_relative './book'
require_relative './author'

#Authors
yas=Author.new("Yaz Jules")
ben=Author.new("Ben Su")
kev=Author.new("Kev Thompson")

dungeons= ["The game was again published as three core rulebooks which incorporated the expansions and revisions which had been published in various supplements over the previous decade."]
kyle= ["Goo Goo Ga Ga. Kyle is my baby. I love Krystal. I don't love you no more"]
# bball= ["Why Michael Jordan Is the GOAT","He has a better Finals record as well as three more rings than LeBron. He also has three more All-Defense selections and one more MVP award. He also has a Defensive Player of the Year award, an accomplishment that has eluded James."]
bball= ["Why Michael Jordan Is the GOAT"]
krystal=["We live in Queens now, James. Three More words"]

#books need title, author, content
dungeons=Book.new("dungeons",yas,dungeons)
kyle=Book.new("kyle",ben,kyle)
bball=Book.new("mj",kev,bball)
krystal=Book.new("krystal",ben,krystal)

#calling the following methods for class Book
Book.all # all books, their author, title, and content
x = bball.author #returns book author object
y= bball.author.author_name #returns book author name
z= bball.title # returns book titile 
a= bball.word_count #returns the strings inside the content

#calling the methods for class Author
b=Author.all #All authors
c=ben.books #return all books by author
d=ben.write_book("james",["ya know I always love you"]) #Authorben writes book #take this line out to test a tie for most words
e=ben.total_words #returns total number words author has written across all books
f=dAuthor.most_words #returns author who has written the most words. returns an array of of authors if there is a tie for most
#b=ben.books # all books for this author
#c records 2 books and ben actually has 3 books, but 3rd book was not record by c due to timing


binding.pry


