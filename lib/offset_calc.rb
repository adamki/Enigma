# require './enigma'

class Offset
  def initialize(key, date)
    @key = key
    @date = date
  end

  def offset
    p "The random gen-key is:#{@key}"
    p "The DDMMYY is:#{@date}"
  end

end


if __FILE__==$0
  time = Time.new
  time_actual = time.strftime("%d%m%y")
  random_key = (1..5).map{rand(0..9)}.join

  final_key = Offset.new(random_key, time_actual)
  final_key.offset
end
