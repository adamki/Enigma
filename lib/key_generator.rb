class KeyGenerator
  attr_accessor :offset  # => nil

  def initialize(date)
    @date = date
  end

  def rotator
    (1..5).map{rand(0..9)}.join  =>34234 =>34, 42, 23, 34
  end


end
