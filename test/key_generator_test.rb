require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_generates_a_random_5_digit_number_key
    key = KeyGenerator.new
    assert 5, key.random_5_digit_key.length
  end

  def test_it_creates_a_new_key_each_time
    key_1 = KeyGenerator.new
    key_2 = KeyGenerator.new
    refute_equal(key_1.random_5_digit_key, key_2.random_5_digit_key)
  end




end
