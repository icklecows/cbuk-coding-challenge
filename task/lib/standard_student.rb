# frozen_string_literal: true

require_relative 'modules/text_processor'

# Creates a standard student with all output fields and default values
class StandardStudent
  include TextProcessor

  ATTRIBUTES = %i[source_id
                  old_source_id
                  pupil_admission_number
                  first_name
                  legal_first_name
                  middle_name
                  last_name
                  legal_last_name
                  former_last_name
                  gender
                  year_code
                  year_group_source_id
                  dob
                  upn
                  former_upn
                  uln
                  is_eal
                  free_meal
                  free_meal_6
                  fsm_review_date
                  ethnicity_code
                  is_pp
                  service_child
                  looked_after
                  ever_in_care
                  sen_category
                  enrolment_status
                  address_line_1
                  address_line_2
                  town_city
                  county
                  country
                  postcode
                  start_date
                  end_date
                  home_language_code
                  home_language_name
                  first_language_code
                  first_language_name
                  proficiency_in_english_code
                  proficiency_in_english_name
                  nationalities
                  country_of_birth
                  photo_hash
                  nhs_number
                  is_pregnant
                  has_emergency_consent].freeze
  attr_accessor(*ATTRIBUTES)

  def initialize(**options)
    ATTRIBUTES.each do |key|
      setter = "#{key}="
      send(setter, options[key]) if respond_to?(setter.to_sym, false)
    end
    self.is_pp = options.keys.include?(:is_pp) ? make_boolean(options[:is_pp]) : false
    set_default_values
  end

  private

  def set_default_values
    self.year_group_source_id ||= '2018-1718'
    self.country_of_birth     ||= 'GBR'
    self.nationalities        ||= 'GBR'
  end
end
