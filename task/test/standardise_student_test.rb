require 'active_support/all'
require 'minitest/autorun'

class StandardStudentTest < Minitest::Test
  def test_output_format
    script_path = File.join(Dir.pwd, 'task/standardise_student.rb')
    expected_output = File.read(File.join(File.dirname(__FILE__), 'fixtures/output_mis_data.json'))
    input_path = File.join(Dir.pwd, File.dirname(__FILE__), 'fixtures/input_mis_data.json')
    output_path = File.join(Dir.pwd, File.dirname(__FILE__), 'tmp/output_mis_data.json')
    %x(`cd .. && ruby #{script_path} -f #{input_path} -o #{output_path}`)
    output = File.read(File.join(File.dirname(__FILE__), 'tmp/output_mis_data.json'))
    assert_equal expected_output, output
  end
end
