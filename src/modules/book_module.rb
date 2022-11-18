require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'

require 'json'
module BookModule
  ## books
  def load_books
    data = []
    file = './JSONdata/books.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'], archived: book['archived'])
      new_book.genre = Genre.new(book['genre'])
      new_book.author = Author.new(book['author']['first_name'], book['author']['last_name'])
      new_book.label = Label.new(book['label'])
      data << new_book
    end

    data
  end

  def list_books
    if @books.empty?
      puts 'The books list is empty'
    else
      puts '** Books list:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}-[Book] ID: #{book.id} | Publisher: #{book.publisher} | " \
             "Publish date: #{book.publish_date} | Cover state: #{book.cover_state} | Archived: #{book.archived}"
      end
    end
  end

  def add_book
    author_first_name = user_input("Author's first name: ")
    author_last_name = user_input("Author's last name: ")
    author = Author.new(author_first_name, author_last_name)

    publish_date = user_input("Book's publish date: ")
    publisher = user_input("Book's publisher: ")
    cover_state = user_input("Book's cover state [good, bad]: ")
    genre = Genre.new(user_input("Book's genre: "))
    label = Label.new(user_input("Book's label: "))
    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.genre = genre
    new_book.label = label
    new_book.author = author
    new_book.move_to_archive
    @books << new_book
    @labels << label
    @genres << genre
    puts 'The book  has been created successfully ✅'
  end

  def store_books(books)
    return if books.empty?

    file = './JSONdata/books.json'
    File.new('./JSONdata/books.json', 'w+') unless File.exist?(file)

    data = []

    books.each do |book|
      data << { id: book.id, publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                archived: book.archived, genre: book.genre, author: book.author, label: book.label }
    end
    File.write(file, JSON.generate(data))
  end

  ## labels
  def store_labels(labels)
    return if labels.empty?

    file = './JSONdata/labels.json'
    File.new('./JSONdata/labels.json', 'w+') unless File.exist?(file)

    data = []

    labels.each do |label|
      data << { id: label.id, name: label.name }
    end
    File.write(file, JSON.generate(data))
  end

  def load_labels
    data = []
    file = './JSONdata/labels.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |label|
      data << Label.new(label['name'], label['id'])
    end

    data
  end

  def list_labels
    if @labels.empty?
      puts 'The Labels list is empty'
    else
      puts '🏷️  Labels list:'
      @labels.each_with_index do |label, index|
        puts "#{index + 1}-[Label] ID: #{label.id} | Name: #{label.name}"
      end
    end
  end
end
