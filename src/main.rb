require_relative 'app'

class Main
  def initialize
    @start = App.new
    @start.options
  end
end

main = Main.new
main
