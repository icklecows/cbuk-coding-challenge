#! /usr/bin/ruby
# frozen_string_literal: true

require 'optparse'
require 'active_support/core_ext/object/json'
require_relative 'lib/input_student'
require_relative 'lib/standard_student'
require_relative 'test/test'

# Provide default options for input and output files
@options = { input_path:  File.join(Dir.pwd, 'task/input_mis_data.json'),
             output_path: File.join(Dir.pwd, 'task/tmp/output_mis_data.json') }

# Allow user to specify different input and output files, run tests and display help
OptionParser.new do |opts|
  opts.on('-fFILENAME', '--file=FILENAME', 'Specify input file path') { |path| @options[:input_path] = path }

  opts.on('-oFILENAME', '--output=FILENAME', 'Specify output file path') { |path| @options[:output_path] = path }

  opts.on('-t', '--test', 'Run test suite') do
    Test.run_test_suite
    exit
  end

  opts.on('-h', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

# Read data from the input file and parse the JSON.
input_data = JSON.parse File.read(@options[:input_path])

# Write out the JSON to a file in the correct format.
File.write(@options[:output_path], JSON.pretty_generate(InputStudent.new(**input_data).as_json, indent: "\t"))
