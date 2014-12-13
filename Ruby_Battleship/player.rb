require_relative 'requirement'

class Player

  def initialize(opts = {})
    @name = opts[:name]
    @fleet = opts[:fleet]
  end

end
