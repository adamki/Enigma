require './key_generator'

class OffsetCalculator
  attr_accessor :date, :key
  def initialize(date, key)
    @date = date
    @key = key
  end

  def offset_calculator
    rotation_pair_setter
    pre_key = rotation_collection.zip(format_time)
    pre_key.map do |pair|
      pair.map(&:to_i).reduce(:+)
    end
  end
end
