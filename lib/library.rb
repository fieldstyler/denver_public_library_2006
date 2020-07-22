class Library

  attr_reader :name,
              :books,
              :authors
  def initialize(name)
    @name     = name
    @books    = []
    @authors  = []
  end

  def add_author(author)
    @authors << author
  end

  def publication_time_frame_for(author)
    # require "pry"; binding.pry
    time_frame_hash = {
                      :start => authors.map do |author|
                        author.books.publication_year
                      end.min,
                      :end => authors.map do |author|
                        author.books.publication_year
                      end.max
                      }
  end
end
