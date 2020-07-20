class Book
    attr_accessor :author_name, :author, :title, :content
    @@all=[]
    
    def initialize (title, author, content)
        @title=title
        @author=author
        temp_array=Array.new(1,content)
        @content=temp_array.flatten
        @@all<<self
    end

    def self.all
        @@all
    end

    def word_count
        @content.join(' ').split(' ').count #join will allow my arrays to join all the strings inside if there are any
    end

end
