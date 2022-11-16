class Book
    attr_accessor :publisher, :cover_state

    def initialize(publish_date, publisher, cover_state)
      super(publish_date, id, archived: archived)
      @publisher = publisher
      @cover_state = cover_state
    end
  
    def can_be_archived?
      super || cover_state == 'bad'
    end
end
