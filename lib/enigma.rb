require './key_generator'


class Enigma
  attr_accessor :output, :key, :date

  def initialize(output)
    @output = output
    @key = KeyGenerator.new
    @date = KeyGenerator.new
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
test.terminal_output
# test.output_file
