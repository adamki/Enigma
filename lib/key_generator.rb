class KeyGenerator

  attr_accessor :rotation_collection, :key  # => nil

  def initialize
    @rotation_collection = []  # => []
    @key ||= random_5_digit_key ###only do once
  end

  #1. Get random 5 digits
  def random_5_digit_key
    (1..5).map{rand(0..9)}.join  # => "33581"
  end

  #2. Set rotation pairs
  def rotation_pair_setter
    rotation_collection << a = key[0..1]  # => ["33"]
    rotation_collection << b = key[1..2]  # => ["33", "35"]
    rotation_collection << c = key[2..3]  # => ["33", "35", "58"]
    rotation_collection << d = key[3..4]  # => ["33", "35", "58", "81"]
  end

  #3. Get Offset values from Current Date
  def current_date
    Time.new.strftime("%d%m%y").to_i  # => 270715
  end

  #3.5 format date
  def format_time
    time = current_date                   # => 270715
    time *= time                          # => 73286611225
    time_digits = time.to_s[-4, 4].chars  # => ["1", "2", "2", "5"]
  end

  #4.Add Rotation to Offset
  def offset_calculator
    rotation_pair_setter                            # => ["33", "35", "58", "81"]
    pre_key = rotation_collection.zip(format_time)  # => [["33", "1"], ["35", "2"], ["58", "2"], ["81", "5"]]
    pre_key.map do |pair|                           # => [["33", "1"], ["35", "2"], ["58", "2"], ["81", "5"]]
      pair.map(&:to_i).reduce(:+)                   # => 34, 37, 60, 86
    end                                             # => [34, 37, 60, 86]
  end
end




if __FILE__==$0            # => true
  key = KeyGenerator.new   # => #<KeyGenerator:0x007fbbcb0a6a70 @rotation_collection=[], @key="33581">
  p key.offset_calculator  # => [34, 37, 60, 86]

end  # => [34, 37, 60, 86]

# >> [34, 37, 60, 86]
