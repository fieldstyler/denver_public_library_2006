class Author

  attr_reader :name,
              :books
  def initialize(author_info)
    @name   = "#{author_info[:first_name]} #{author_info[:last_name]}"
    @books  = []
  end

  def write(book_name, publication_date)
    book = Book.new(
                    {
                      author: self.name,
                      title: book_name,
                      publication_date: publication_date
                    }
                  )
    # add_book(book)
    # This changes the class from Book to Array. Why?
    # require "pry"; binding.pry
  end

  def add_book(book)
    @books << book
  end

end
