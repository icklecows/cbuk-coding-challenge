require 'minitest/autorun'
require_relative '../lib/standard_student'

class StandardStudentTest < Minitest::Test
  def test_new
    assert_equal '1091', StandardStudent.new(source_id: '1091').source_id
  end

  def test_missing_input_value_returns_nil
    assert_nil StandardStudent.new.source_id
  end

  def test_missing_year_group_source_id_returns_default
    assert_equal '2018-1718', StandardStudent.new.year_group_source_id
  end

  def test_missing_nationalities_returns_default
    assert_equal 'GBR', StandardStudent.new.nationalities
  end

  def test_missing_country_of_birth_returns_default
    assert_equal 'GBR', StandardStudent.new().country_of_birth
  end

  def test_is_pp_returns_boolean
    assert_equal true, StandardStudent.new(is_pp: 'Y').is_pp
    assert_equal false, StandardStudent.new.is_pp
  end
end
