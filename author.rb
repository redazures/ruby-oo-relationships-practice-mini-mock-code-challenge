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
        most ="" #person with most words
        count=0 #tracks most words
        extra=[] #this array will catch any author that ties the most words after the first most words author is ID
        Author.all.each do |e|
            puts e.total_words
            puts e
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