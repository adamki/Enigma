class KeyGenerator
  attr_accessor :offset, :date, :rotation_collection, :key

  def initialize
    @rotation_collection = []
    @key ||= random_5_digit_key ###only do once
  end

  #1. Get random 5 digits
  def random_5_digit_key
    (1..5).map{rand(0..9)}.join
  end

  #2. Set rotation pairs
  def rotation_pair_setter
    rotation_collection << a = key[0..1]
    rotation_collection << b = key[1..2]
    rotation_collection << c = key[2..3]
    rotation_collection << d = key[3..4]
  end

  #3. Get Offset values from Current Date
  def get_formatted_time
    time = Time.new.strftime("%d%m%y").to_i
    time *= time
    time_digits = time.to_s[-4, 4].chars
  end

  #4. Add rotation to Offset
  def final_key
    rotation_pair_setter
    pre_key = rotation_collection.zip(get_formatted_time)
    pre_key.map do |pair|
      pair.map(&:to_i).reduce(:+)
    end
  end
end




if __FILE__==$0
  key_generator = KeyGenerator.new
  key_generator.final_key
end
