class Book

    attr_reader :title, :word_count
    @@all=[]

    def initialize (title,word_count)
        @title=title
        @word_count=word_count
        save
    end

    def self.all
        @@all
    end

    def book_authored
        Authored.all.select{|e|e.book==self}
    end

    def authors
        self.book_authored.map{|e|e.author} #.uniq #if x.length>0
    end

    private 
    def save
    @@all<<self
    end

end