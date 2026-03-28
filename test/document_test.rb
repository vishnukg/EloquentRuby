require "minitest/autorun"
require_relative "../lib/document"

class TestDocument < Minitest::Test
  def setup
    @document = Document.new(
      title: "Eloquent Ruby",
      author: "Russ Olsen",
      content: "Ruby is a dynamic language"
    )
  end

  def test_title_is_set_on_initialization
    assert_equal "Eloquent Ruby", @document.title
  end

  def test_author_is_set_on_initialization
    assert_equal "Russ Olsen", @document.author
  end

  def test_content_is_set_on_initialization
    assert_equal "Ruby is a dynamic language", @document.content
  end

  def test_title_can_be_updated
    @document.title = "New Title"
    assert_equal "New Title", @document.title
  end

  def test_author_can_be_updated
    @document.author = "New Author"
    assert_equal "New Author", @document.author
  end

  def test_content_can_be_updated
    @document.content = "Updated content here"
    assert_equal "Updated content here", @document.content
  end

  def test_word_splits_content_into_array
    assert_equal ["Ruby", "is", "a", "dynamic", "language"], @document.word
  end

  def test_word_returns_empty_array_for_empty_content
    doc = Document.new(title: "Empty", author: "Nobody", content: "")
    assert_equal [], doc.word
  end

  def test_word_count_returns_number_of_words
    assert_equal 5, @document.word_count
  end

  def test_word_count_returns_zero_for_empty_content
    doc = Document.new(title: "Empty", author: "Nobody", content: "")
    assert_equal 0, doc.word_count
  end

  def test_word_count_returns_one_for_single_word
    doc = Document.new(title: "Single", author: "Author", content: "Hello")
    assert_equal 1, doc.word_count
  end

  def test_word_splits_on_multiple_spaces
    doc = Document.new(title: "Spaced", author: "Author", content: "word1  word2   word3")
    assert_equal ["word1", "word2", "word3"], doc.word
    assert_equal 3, doc.word_count
  end
end
