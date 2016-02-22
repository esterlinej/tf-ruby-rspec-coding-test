$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coding_test'

include CodingTest

class String
  def is_number?
    true if Float(self) rescue false
  end
end