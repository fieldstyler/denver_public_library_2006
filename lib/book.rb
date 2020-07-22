class Book

  attr_reader :author,
              :title,
              :publication_year
  def initialize(book_info)
    @author = "#{book_info[:author_first_name]} #{book_info[:author_last_name]}"
    @title  = book_info[:title]
    @publication_year = book_info[:publication_date].split(', ')[1]
  end

end
