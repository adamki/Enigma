class KeyGenerator
  attr_accessor :rotation_collection, :key  # => nil

  def initialize
    @rotation_collection = []  # => []
    @key ||= random_5_digit_key ###only do once
  end

  #1. Get random 5 digits
  def random_5_digit_key
    (1..5).map{rand(0..9)}.join  # => "73359"
  end

  #2. Set rotation pairs
  def rotation_pair_setter
    rotation_collection << a = key[0..1]  # => ["73"]
    rotation_collection << b = key[1..2]  # => ["73", "33"]
    rotation_collection << c = key[2..3]  # => ["73", "33", "35"]
    rotation_collection << d = key[3..4]  # => ["73", "33", "35", "59"]
  end

  #3. Get Offset values from Current Date
  def current_date
    Time.new.strftime("%d%m%y").to_i  # => 260715
  end

  def format_time
    time = current_date                   # => 260715
    time *= time                          # => 67972311225
    time_digits = time.to_s[-4, 4].chars  # => ["1", "2", "2", "5"]
  end


  #4.Add Rotation to Offset

  def offset_calculator
    rotation_pair_setter                            # => ["73", "33", "35", "59"]
    pre_key = rotation_collection.zip(format_time)  # => [["73", "1"], ["33", "2"], ["35", "2"], ["59", "5"]]
    pre_key.map do |pair|                           # => [["73", "1"], ["33", "2"], ["35", "2"], ["59", "5"]]
      pair.map(&:to_i).reduce(:+)                   # => 74, 35, 37, 64
    end                                             # => [74, 35, 37, 64]
  end
end




if __FILE__==$0            # => true
  key = KeyGenerator.new   # => #<KeyGenerator:0x007fd3ac93a6c0 @rotation_collection=[], @key="73359">
  p key.offset_calculator  # => [74, 35, 37, 64]
end                        # => [74, 35, 37, 64]

# >> [74, 35, 37, 64]
