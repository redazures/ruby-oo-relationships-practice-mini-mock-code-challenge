class Author

    attr_accessor :author_name
    @@all=[]

    def initialize(author_name)
        @author_name=author_name
        @@all<<self
    end

    def self.all
        @@all
    end

    def authored (book)
        Authored.new(self,book)
    end

    def books 
        Authored.all.select{|e|e.author==self}
    end

    def write_book (book)
        authored(book)
    end

    def total_words
        x=books.map{|e|e.book}.map{|e|e.content}.flatten.join(' ').split(' ').count
        # x=x.map{|e|e.content}
        # x=x.map{|e|e.word_count}
        # x.select.{|e|e.total_words}
    end

    def self.most_words
        # most ="" #person with most words
        # count=0 #tracks most words
        # extra=[] #this array will catch any author that ties the most words after the first most words author is ID
        # Author.all.each do |e|
        #     puts e.total_words
        #     puts e
        #     most = e if e.total_words > count
        #     extra<< e if e.total_words == count
        #     count= e.total_words if e.total_words>count
        # end
        # extra<<most if extra.any?
        # most=extra if extra.any?
        # puts "#{most} has written #{count} words"
        # most
        self.all.max_by {|e|e.total_words}
    end
end

class Authored
    
    attr_accessor :author, :book
    @@all=[]

    def initialize (author, book)
        @author=author
        @book=book
        @@all<<self
    end

    def self.all
        @@all
    end

end

class Book

    attr_accessor :title, :content
    @@all=[]

    def initialize (title,content)
        @title=title
        temp_array=Array.new(1,content)
        @content=temp_array.flatten
        @@all<<self
    end

    def self.all
        @@all
    end

    def author
        # phrase="This book has not been authored by anyone yet. Claim it today"
        x= Authored.all.select{|e|e.book==self} #if x.length>0
        x[0].author
    end

    def word_count
        @content.join(' ').split(' ').count #join will allow my arrays to join all the strings inside if there are any
    end
end

require 'pry'
require_relative './book'
require_relative './author'
require_relative './authored'

# #Authors
yas=Author.new("Yaz Jules")
ben=Author.new("Ben Su")
kev=Author.new("Kev Thompson")

dungeons= ["The game was again published as three core rulebooks which incorporated the expansions and revisions which had been published in various supplements over the previous decade."]
kyle= ["Goo Goo Ga Ga. Kyle is my baby. I love Krystal. I don't love you no more"]
# bball= ["Why Michael Jordan Is the GOAT","He has a better Finals record as well as three more rings than LeBron. He also has three more All-Defense selections and one more MVP award. He also has a Defensive Player of the Year award, an accomplishment that has eluded James."]
bball= ["Why Michael Jordan Is the GOAT"]
krystal=["We live in Queens now, James. Three More words"]

#books need title, author, content
# dungeons=Book.new("dungeons",yas,dungeons)
# kyle=Book.new("kyle",ben,kyle)
# bball=Book.new("mj",kev,bball)
# krystal=Book.new("krystal",ben,krystal)

#**************Adjusted Books for Many to Many******************
dungeons=Book.new("dungeons",dungeons)
kyle=Book.new("kyle",kyle)
bball=Book.new("mj",bball)
krystal=Book.new("krystal",krystal)
james=Book.new("james",["ya know I always love you"])
#authored needs author and book
dungeons_a=yas.write_book(dungeons)
kyle_a=ben.authored(kyle)
bball_a=kev.authored(bball)
krystal_a=ben.authored(krystal)
#^^^^^^^^^^^^^^Adjusted Books for Many to Many^^^^^^^^^^^^^^^^^^

#calling the following methods for class Book
Book.all # all books with title, and content
x = bball.author #returns book author object
y= bball.author.author_name #returns book author name
z= bball.title # returns book titile 
a= bball.word_count #returns the strings inside the content

#calling the methods for class Author
b=Author.all #All authors
c=ben.books #return all books by author
d=ben.write_book(james) #Authorben writes book #take this line out to test a tie for most words
e=ben.total_words #returns total number words author has written across all books
f=Author.most_words #returns author who has written the most words. returns an array of of authors if there is a tie for most
#b=ben.books # all books for this author
#c records 2 books and ben actually has 3 books, but 3rd book was not record by c due to timing


binding.pry


