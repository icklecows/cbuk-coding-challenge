# frozen_string_literal: true

require 'minitest/autorun'

# A system test to make sure the output file is generated and correctly formatted
class StandardStudentTest < Minitest::Test
  def test_output_format
    generate_paths
    generate_expected_output
    generate_output
    assert_equal @expected_output, @output
    cleanup_tmp_file
  end

  private

  def generate_paths
    @script_path = File.join(Dir.pwd, 'task/standardise_student.rb')
    @expected_output_path = File.join(Dir.pwd, 'task/test/fixtures/output_mis_data.json')
    @input_path = File.join(Dir.pwd, 'task/test/fixtures/input_mis_data.json')
    @output_path = File.join(Dir.pwd, 'task/test/tmp/output_mis_data.json')
  end

  def generate_expected_output
    @expected_output = File.read(@expected_output_path)
  end

  def generate_output
    %x(`cd .. && ruby #{@script_path} -f #{@input_path} -o #{@output_path}`)
    @output = File.read(@output_path)
  end

  def cleanup_tmp_file
    %x(`rm #{@output_path}`)
  end
end
