require './key_generator'  # ~> LoadError: cannot load such file -- ./key_generator

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

# ~> LoadError
# ~> cannot load such file -- ./key_generator
# ~>
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/turing/module1/week_3/enigma/lib/offset_calc.rb:1:in `<main>'
