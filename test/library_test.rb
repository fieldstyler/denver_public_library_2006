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

  def test_it_has_attributes
    dpl = Library.new("Denver Public Library")
    assert_equal "Denver Public Library", dpl.name
    assert_equal [], dpl.books
    assert_equal [], dpl.authors
  end

  def test_it_has_authors
  dpl = Library.new("Denver Public Library")
  charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  professor   = charlotte_bronte.write("The Professor", "1857")
  villette    = charlotte_bronte.write("Villette", "1853")
  harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
  mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  dpl.add_author(charlotte_bronte)
  dpl.add_author(harper_lee)
  assert_equal [charlotte_bronte, harper_lee], dpl.authors
  end

  def test_author_publication_time_frame
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor   = charlotte_bronte.write("The Professor", "1857")
    villette    = charlotte_bronte.write("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    assert_equal ({:start=>"1847", :end=>"1857"}), dpl.publication_time_frame_for(charlotte_bronte)
    assert_equal ({:start => "1960", :end => "1960"}), dpl.publication_time_frame_for(harper_lee)
  end

end
