require_relative '../src/classes/book'
require_relative '../src/classes/item'

describe Book do
  before :each do
    @book = Book.new('12-12-2022', 'Alazar', 'bad', archived: true)
  end

  describe '#new' do
    it 'creates an instance of the book class' do
      @book.should(be_an_instance_of(Book))
    end
  end

  it 'throws an argument error when parameters are less than or greater than is expected' do
    -> { Book.new '12-12-2022' }.should raise_error ArgumentError
  end

  describe 'tests for methods in book class' do
    it 'should show if a movie can be archieved or not' do
      expect(@book.can_be_archived?).to eql true
    end
  end
end
