require 'date'
class Item
  attr_accessor :pubish_date, :archived, :label, :author, :genre, :source
  attr_reader :id

  def initialize(pubish_date)
    @id = rand(1..1_000)
    @pubish_date = pubish_date
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
    Date.today - Date.parse(@pubish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
