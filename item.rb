class Item
    def initialize(genre, author, source, label, publish_date)
        @id = rand(1..9999)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = false
    end

    def can_be_archived?
        return true if @publish_date>10
    end

    def move_to_archive
        @archived = true if can_be_archived? == true
    end
    private: can_be_archived?
end