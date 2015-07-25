require './key_generator'
require './offset_calc'

class Enigma
  attr_accessor :output

  def initialize( output)
    @output = output
  end

  def read_file
    @input = File.open("message.txt", "r")
    @input.read
    @input.rewind
  end

  def terminal_output
    time = Time.new
    time_actual = time.strftime("%d%m%y")
    key = KeyGenerator.new(time_actual)
    puts "Created '#{output}' with the key #{key.random} and date #{time_actual}"
  end

  def output_file
    out = File.open("encrypted.txt", "w")
    out.write(@input.read)
    out.close
  end
end



# test = Enigma.new( ARGV[0] )
# test.read_file
# test.terminal_output
# test.output_file
