Write any notes you want to make here. For example, you might want to
tell us how to install any dependencies and run the program you've
written.

## Data map

This map shows how the Input fields will map to the output fields, with any data transformations needed.

| Input Field | Output Field | Transformation needed |
|-------------|--------------|-----------------------|
| LearnerId | source_id | int to string |
| - | old_source_id | missing value to null |
| LearnerCode | pupil_admission_number | - |
| Forename | first_name | - |
| LegalForename | legal_first_name | - |
| MiddleName | middle_name | - |
| Surname | last_name | - |
| LegalSurname | legal_last_name | - |
| FormerSurname | former_last_name | - |
| Gender | gender | - |
| Year | year_code | - |
| - | year_group_source_id | add default value "2018-1718" |
| DateOfBirth | dob | date to datetime |
| UPN | upn | - |
| FormerUPN | former_upn | - |
| ULN | uln | - |
| EAL | is_eal | - |
| - | free_meal | missing value to null |
| - | free_meal_6 | missing value to null |
| - | fsm_review_date | missing value to null |
| Ethnicity | ethnicity_code | - |
| - | is_pp | missing value to boolean |
| ServiceChild | service_child | string to boolean |
| IsLookedAfterorAdoptedFromCare | looked_after | null to boolean |
| - | ever_in_care | missing value to null |
| SENProvisionDetails.ProvisionTypeCode | sen_category | - |
| EnrolementStatus | enrolment_status | - |
| AddressDetails.Flat&Number&Street | address_line_1 | concatenate strings |
| AddressDetails.Locality | address_line_2 | - |
| AddressDetails.Town | town_city | - |
| AddressDetails.County | county | - |
| AddressDetails.Country | country | - |
| AddressDetails.PostCode | postcode | - |
| DateOfEntry | start_date | date to datetime |
| - | end_date | missing value to null |
| - | home_language_code | missing value to null |
| - | home_language_name | missing value to null |
| LanguageDetails.LanguageCode | first_language_code | - |
| - | first_language_name | missing value to null |
| - | proficiency_in_english_code | missing value to null |
| - | proficiency_in_english_name | missing value to null |
| - | nationalities | add default value "GBR" |
| - | country_of_birth | add default value "GBR" |
| - | photo_hash | missing value to null |
| - | nhs_number | missing value to null |
| - | is_pregnant | missing value to null |
| - | has_emergency_consent | missing value to null |
