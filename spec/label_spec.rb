require_relative '../src/classes/label'
require_relative '../src/classes/item'

describe Label do
  before :each do
    @label = Label.new('IT')
  end

  describe '#new' do
    it 'label an instance of the label class' do
      @label.should(be_an_instance_of(Label))
    end
  end

  it 'throws an argument error when parameters are less than or greater than is expected' do
    -> { Source.new }.should raise_error ArgumentError
  end

  describe 'tests for methods in source class' do
    it 'should add an item' do
      item = Item.new('IT')
      @label.add_item(item)
      expect(@label.items.length).to eql 1
    end
  end
end
