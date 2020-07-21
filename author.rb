class Author

    attr_reader :author_name
    @@all=[]

    def initialize(author_name)
        @author_name=author_name
        save
    end

    def self.all
        @@all
    end

    def books
        Authored.all.select{|e|e.author==self}
    end

    def total_words
        self.books.sum{|e|e.book.word_count}
    end

    def self.most_words
        Author.all.max_by{|e|e.total_words}
    end

    private 
    def save
    @@all<<self
    end

end