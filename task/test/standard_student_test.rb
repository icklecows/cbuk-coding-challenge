require 'minitest/autorun'
require_relative '../lib/standard_student'

class StandardStudentTest < Minitest::Test
  def test_new
    assert "1091", StandardStudent.new(source_id: "1091").source_id
  end
end