class Genre
  attr_reader :name, :item

  def initialize(name, _item)
    @id = rand(1..100)
    @name = name
    @item = []
  end

  def add_item(item)
    @item << item
  end
end
