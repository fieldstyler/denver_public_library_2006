require "./lib/book"
require "./lib/author"
require "./lib/library"
require "minitest/autorun"
require "minitest/pride"

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new("Denver Public Library")
    assert_instance_of Library, dpl
  end

  #def test_it_has_attributes
  #end

end
