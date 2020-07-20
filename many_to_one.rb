# class Author

#     attr_accessor :author_name, :author, :title, :content
#     @@all =[]

#     def initialize (name)
#         @author_name=name
#         @@all<<self 
#     end 

#     def self.all
#         @@all
#     end

#     def books
#         Book.all.select{|e|e.author==self} #I am using e for each of the items inside Books
#     end

#     def write_book(title,content)
#         Book.new(title,content)
#     end

#     def total_words
#         books.map{|e|e.content}.flatten.join(' ').split(' ').count
#     end

#     def self.most_words
#         most ="" #person with most words
#         count=0 #tracks most words
#         extra=[] #this array will catch any author that ties the most words after the first most words author is ID
#         Author.all.each do |e|
#             # puts e.total_words
#             most = e if e.total_words > count
#             extra<< e if e.total_words == count
#             count= e.total_words if e.total_words>count
#         end
#         extra<<most if extra.any?
#         most=extra if extra.any?
#         puts "#{most} has written #{count} words"
#         most
#     end

# end

# class Book
#     attr_accessor :author_name, :author, :title, :content
#     @@all=[]
    
#     def initialize (title, author, content)
#         @title=title
#         @author=author
#         temp_array=Array.new(1,content)
#         @content=temp_array.flatten
#         @@all<<self
#     end

#     def self.all
#         @@all
#     end

#     def word_count
#         @content.join(' ').split(' ').count #join will allow my arrays to join all the strings inside if there are any
#     end

# end

# #calling the following methods for class Book
# Book.all # all books, their author, title, and content
# x = bball.author #returns book author object
# y= bball.author.author_name #returns book author name
# z= bball.title # returns book titile 
# a= bball.word_count #returns the strings inside the content

# #calling the methods for class Author
# b=Author.all #All authors
# c=ben.books #return all books by author
# d=ben.write_book("james",["ya know I always love you"]) #Authorben writes book #take this line out to test a tie for most words
# e=ben.total_words #returns total number words author has written across all books
# f=dAuthor.most_words #returns author who has written the most words. returns an array of of authors if there is a tie for most
# #b=ben.books # all books for this author
# #c records 2 books and ben actually has 3 books, but 3rd book was not record by c due to timing
