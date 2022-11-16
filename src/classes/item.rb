require 'date'
class Item
  attr_accessor :publish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(publish_date)
    @id = rand(1..1_000)
    @publish_date = publish_date
  end

  def add_source(source)
    @source = source
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def can_be_archived?
    Date.today - Date.parse(@publish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
