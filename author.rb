class Author

    attr_accessor :author_name, :author, :title, :content
    @@all =[]

    def initialize (name)
        @author_name=name
        @@all<<self 
    end 

    def self.all
        @@all
    end

    def books
        Book.all.select{|e|e.author==self} #I am using e for each of the items inside Books
    end

    def write_book(title,content)
        Book.new(title,self,content)
    end

    def total_words
        books.map{|e|e.content}.flatten.join(' ').split(' ').count
    end

    def self.most_words
        most ="" #person with most words
        count=0 #tracks most words
        extra=[] #this array will catch any author that ties the most words after the first most words author is ID
        Author.all.each do |e|
            # puts e.total_words
            most = e if e.total_words > count
            extra<< e if e.total_words == count
            count= e.total_words if e.total_words>count
        end
        extra<<most if extra.any?
        most=extra if extra.any?
        puts "#{most} has written #{count} words"
        most
    end

end