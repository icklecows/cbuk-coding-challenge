require 'active_support/all'
require_relative 'modules/text_processor'
require_relative 'standard_student'

class InputStudent < StandardStudent
  include TextProcessor

  # Maps the input fields to the standardised output fields
  DATA_MAP = { 'LearnerId'                      => 'source_id',
               'LearnerCode'                    => 'pupil_admission_number',
               'Forename'                       => 'first_name',
               'LegalForename'                  => 'legal_first_name',
               'Surname'                        => 'last_name',
               'LegalSurname'                   => 'legal_last_name',
               'FormerSurname'                  => 'former_last_name',
               'Year'                           => 'year_code',
               'DateOfBirth'                    => 'dob',
               'EAL'                            => 'is_eal',
               'Ethnicity'                      => 'ethnicity_code',
               'IsLookedAfterorAdoptedFromCare' => 'looked_after',
               'SENProvisionDetails'            => 'sen_category',
               'EnrolementStatus'               => 'enrolment_status',
               'DateOfEntry'                    => 'start_date',
               'LanguageDetails'                => 'first_language_code' }.freeze

  PROCESSED_FIELDS = %w[address_details
                        dob
                        first_language_code
                        looked_after
                        sen_category
                        service_child
                        source_id
                        start_date].freeze

  def initialize(**options)
    options = standardise(options)
    super
  end

  private

  def standardise(options)
    standard_data = {}
    options.each do |key, value|
      standard_data[output_code(key)] = output_data(output_code(key), value)
    end
    standard_data = standard_data.merge(standard_data['address_details']) if standard_data['address_details'].present?
    standard_data
  end

  def output_code(input_code)
    if DATA_MAP.keys.include? input_code
      DATA_MAP[input_code]
    else
      input_code.underscore
    end
  end

  def output_data(key, input_data)
    return input_data unless PROCESSED_FIELDS.include? key

    send("process_#{key}", input_data)
  end

  def process_source_id(input_data)
    input_data.to_s
  end

  def process_dob(input_data)
    standardise_date(input_data.to_datetime)
  end

  def process_service_child(input_data)
    make_boolean(input_data)
  end

  def process_looked_after(input_data)
    make_boolean(input_data)
  end

  def process_start_date(input_data)
    standardise_date(input_data.to_datetime)
  end

  def process_sen_category(input_data)
    input_data.first['ProvisionTypeCode']
  end

  def process_address_details(input_data)
    input_data = input_data.first
    first_line = make_address_first_line(input_data['Flat'], input_data['Number'], input_data['Street'])
    { 'address_line_1' => first_line,
      'address_line_2' => input_data['Locality'],
      'town_city'      => input_data['Town'],
      'county'         => input_data['County'],
      'country'        => input_data['Country'],
      'postcode'       => input_data['PostCode'] }
  end

  def process_first_language_code(input_data)
    input_data.first['LanguageCode']
  end

  def make_address_first_line(flat, number, street)
    "#{'Flat ' + flat + ' ' if flat.present?}#{number} #{street}"
  end
end
