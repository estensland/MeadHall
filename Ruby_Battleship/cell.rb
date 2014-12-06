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
      peg = 'red'
      contains.hit(@letter, @number)
      'Hit'
    else
      peg = 'white'
      'Miss'
    end
  end

  def has_peg?
    !!peg
  end

  def has_ship?
    contains != 'empty'
  end
end