require "minitest/autorun"
require_relative "../lib/document"

class TestDocument < Minitest::Test
  def test_title_is_set_on_initialization
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    title = document.title

    assert_equal "Eloquent Ruby", title
  end

  def test_author_is_set_on_initialization
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    author = document.author

    assert_equal "Russ Olsen", author
  end

  def test_content_is_set_on_initialization
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    content = document.content

    assert_equal "Ruby is a dynamic language", content
  end

  def test_title_can_be_updated
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    document.title = "New Title"

    assert_equal "New Title", document.title
  end

  def test_author_can_be_updated
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    document.author = "New Author"

    assert_equal "New Author", document.author
  end

  def test_content_can_be_updated
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    document.content = "Updated content here"

    assert_equal "Updated content here", document.content
  end

  def test_word_splits_content_into_array
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    words = document.words

    assert_equal ["Ruby", "is", "a", "dynamic", "language"], words
  end

  def test_word_returns_empty_array_for_empty_content
    document = Document.new(title: "Empty", author: "Nobody", content: "")

    words = document.words

    assert_equal [], words
  end

  def test_word_count_returns_number_of_words
    document = Document.new(title: "Eloquent Ruby", author: "Russ Olsen", content: "Ruby is a dynamic language")

    count = document.words_count

    assert_equal 5, count
  end

  def test_word_count_returns_zero_for_empty_content
    document = Document.new(title: "Empty", author: "Nobody", content: "")

    count = document.words_count

    assert_equal 0, count
  end

  def test_word_count_returns_one_for_single_word
    document = Document.new(title: "Single", author: "Author", content: "Hello")

    count = document.words_count

    assert_equal 1, count
  end

  def test_word_splits_on_multiple_spaces
    document = Document.new(title: "Spaced", author: "Author", content: "word1  word2   word3")

    words = document.words
    count = document.words_count

    assert_equal ["word1", "word2", "word3"], words
    assert_equal 3, count
  end
end
