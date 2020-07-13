# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/input_student'

# Tests the InputStudent class to make sure that field names are mapped and value processing is accurate
class InputStudentTest < Minitest::Test
  EXAMPLE_ADDRESS_DATA = [{ 'Country'   => 'GBR',
                            'Type'      => 'H',
                            'Flat'      => '',
                            'Number'    => '268',
                            'Street'    => 'Coronation Street',
                            'Locality'  => '',
                            'Town'      => 'Derby',
                            'County'    => '',
                            'PostCode'  => 'DE3 3FE',
                            'AddressId' => 1211 }].freeze

  def test_new
    assert InputStudent.new.is_a? StandardStudent
  end

  def test_created_with_correct_data_mapping
    assert_equal 'Vicki', InputStudent.new('Forename' => 'Vicki').first_name
  end

  def test_output_code
    assert_equal 'former_upn', InputStudent.new.send('output_code', 'FormerUPN')
    assert_equal 'source_id', InputStudent.new.send('output_code', 'LearnerId')
  end

  def test_process_source_id
    assert_equal '1091', InputStudent.new('LearnerId' => 1091).source_id
  end

  def test_process_dob
    assert_equal '09/06/1999 00:00:00', InputStudent.new('DateOfBirth' => '09/06/1999').dob
  end

  def test_process_service_child
    assert_equal false, InputStudent.new('ServiceChild' => 'N').service_child
  end

  def test_process_looked_after
    assert_equal false, InputStudent.new('IsLookedAfterorAdoptedFromCare' => nil).looked_after
  end

  def test_process_start_date
    assert_equal '01/09/2010 00:00:00', InputStudent.new('DateOfEntry' => '01/09/2010').start_date
  end

  def test_process_sen_category
    assert_equal 'E', InputStudent.new('SENProvisionDetails' => [{ 'ProvisionTypeCode' => 'E' }]).sen_category
  end

  def test_process_address_details
    student = InputStudent.new('AddressDetails' => EXAMPLE_ADDRESS_DATA)
    assert_equal '268 Coronation Street', student.address_line_1
    refute student.respond_to? :address_details
  end

  def test_process_first_language_code
    assert_equal 'ENG', InputStudent.new('LanguageDetails' => [{ 'LanguageCode' => 'ENG' }]).first_language_code
  end
end
