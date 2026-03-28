class Document
  attr_accessor :title, :author, :content

  def initialize(title:, author:, content:)
    @title = title
    @author = author
    @content = content
  end

  def word
    @content.split
  end

  def word_count
    word.size
  end
end
