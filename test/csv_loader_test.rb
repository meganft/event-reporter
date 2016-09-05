require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_loader'

class CSVLoaderTest < Minitest::Test
  def test_can_load_csv_file
    loader = CSVLoader.new
    
  end

end
