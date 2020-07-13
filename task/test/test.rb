# frozen_string_literal: true

# A utility class to allow the test suite to be run from the main program
class Test
  def self.run_test_suite
    Dir[File.join(Dir.pwd, '/**/*_test.rb')].each { |file| require file }
  end
end
