require './key_generator'  # ~> LoadError: cannot load such file -- ./key_generator

class Enigma
  attr_accessor :output, :key, :date, :offset

  def initialize(output)
    @output = output
    @key = KeyGenerator.new
    @date = KeyGenerator.new
    @offset = OffsetCalculator.new(key.random_5_digit_key, date.current_date)
  end

  def read_file
    @input = File.open("message.txt", "r")
    @input.read
    @input.rewind
  end


  def terminal_output
    puts "Created '#{output}' with the key #{key.random_5_digit_key} and date #{date.current_date}"
  end


  def output_file
    out = File.open("encrypted.txt", "w")
    out.write(@input.read)
    out.close
  end
end



test = Enigma.new( ARGV[0] )
# test.read_file
test.offset
test.terminal_output
# test.output_file

# ~> LoadError
# ~> cannot load such file -- ./key_generator
# ~>
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/adamki/turing/module1/week_3/enigma/lib/enigma.rb:1:in `<main>'
