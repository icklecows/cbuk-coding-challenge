class StandardStudent
  attr_accessor :source_id,
                :old_source_id,
                :pupil_admission_number,
                :first_name,
                :legal_first_name,
                :middle_name,
                :last_name,
                :legal_last_name,
                :former_last_name,
                :gender,
                :year_code,
                :year_group_source_id,
                :dob,
                :upn,
                :former_upn,
                :uln,
                :is_eal,
                :free_meal,
                :free_meal_6,
                :fsm_review_date,
                :ethnicity_code,
                :is_pp,
                :service_child,
                :looked_after,
                :ever_in_care,
                :sen_category,
                :enrolment_status,
                :address_line_1,
                :address_line_2,
                :town_city,
                :county,
                :country,
                :postcode,
                :start_date,
                :end_date,
                :home_language_code,
                :home_language_name,
                :first_language_code,
                :first_language_name,
                :proficiency_in_english_code,
                :proficiency_in_english_name,
                :nationalities,
                :country_of_birth,
                :photo_hash,
                :nhs_number,
                :is_pregnant,
                :has_emergency_consent

  def initialize(**options)
    options.each do |key, value|
      setter = "#{key}="
      send(setter, value) if respond_to?(setter.to_sym, false)
    end
    # Note: In practice, there should be a method in place of `true` to check for negative-like values in the input,
    # e.g. 'N', '', 'No', 0.  I have not implemented that here as it did not map to a field in the input file, and it
    # was unclear what it might mean
    self.is_pp = options.keys.include?(:is_pp) ? true : false
    set_default_values
  end

  private

  def set_default_values
    self.year_group_source_id ||= '2018-1718'
    self.country_of_birth     ||= 'GBR'
    self.nationalities        ||= 'GBR'
  end
end
