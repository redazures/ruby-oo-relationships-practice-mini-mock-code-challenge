class Authored
    
    attr_reader :author, :book
    @@all=[]

    def initialize (book, author)        
        @book=book
        @author=author
        save
    end

    def self.all
        @@all
    end

    private 
    def save
    @@all<<self
    end

end
