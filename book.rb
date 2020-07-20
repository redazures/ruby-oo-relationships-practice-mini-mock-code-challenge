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