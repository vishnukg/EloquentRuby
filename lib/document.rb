class Document
  attr_accessor :title, :author, :content

  def initialize(title:, author:, content:)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def words_count
    words.count
  end
end
