class Cell
  attr_accessor :letter, :number, :contains, :peg

  def initialize(opts)
    @letter = opts[:letter]
    @number = opts[:number]
    @contains = opts[:contains]
    @peg = nil
  end

  def shot
    if has_ship?
      self.peg = 'red'
      self.contains.hit(@letter, @number)
      'Hit'
    else
      self.peg = 'white'
      'Miss'
    end
  end

  def has_peg?
    !!self.peg
  end

  def has_ship?
    self.contains != 'empty'
  end
end