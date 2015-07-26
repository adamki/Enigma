class KeyGenerator
  attr_accessor :rotation_collection, :key  # => nil

  def initialize
    @rotation_collection = []  # => []
    @key ||= random_5_digit_key ###only do once
  end

  #1. Get random 5 digits
  def random_5_digit_key
    (1..5).map{rand(0..9)}.join  # => "52687"
  end

  #2. Set rotation pairs
  def rotation_pair_setter
    rotation_collection << a = key[0..1]  # => ["52"]
    rotation_collection << b = key[1..2]  # => ["52", "26"]
    rotation_collection << c = key[2..3]  # => ["52", "26", "68"]
    rotation_collection << d = key[3..4]  # => ["52", "26", "68", "87"]
  end

  #3. Get Offset values from Current Date
  def current_date
    Time.new.strftime("%d%m%y").to_i  # => 250715
  end

  def format_time
    time = current_date                   # => 250715
    time *= time                          # => 62858011225
    time_digits = time.to_s[-4, 4].chars  # => ["1", "2", "2", "5"]
  end

  #4. Add Rotation to Offset
  def final_key
    rotation_pair_setter                            # => ["52", "26", "68", "87"]
    pre_key = rotation_collection.zip(format_time)  # => [["52", "1"], ["26", "2"], ["68", "2"], ["87", "5"]]
    pre_key.map do |pair|                           # => [["52", "1"], ["26", "2"], ["68", "2"], ["87", "5"]]
      pair.map(&:to_i).reduce(:+)                   # => 53, 28, 70, 92
    end                                             # => [53, 28, 70, 92]
  end
end



if __FILE__==$0                     # => true
  key_generator = KeyGenerator.new  # => #<KeyGenerator:0x007f92ba87ecf0 @rotation_collection=[], @key="52687">
  key_generator.final_key           # => [53, 28, 70, 92]
end                                 # => [53, 28, 70, 92]
