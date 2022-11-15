require_relative 'app'

class Main
  def initialize
    @app = App.new
    @app.options
  end
end

main = Main.new
main
