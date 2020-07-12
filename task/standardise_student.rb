require 'optparse'
require 'json'
require_relative 'lib/input_student'
require_relative 'lib/standard_student'

@options = {}

OptionParser.new do |opts|
  opts.on('-fFILENAME', '--file=FILENAME', 'Specify input file path') do |path|
    @options[:input_path] = path
  end

  opts.on('-oFILENAME', '--output=FILENAME', 'Specify output file path') do |path|
    @options[:output_path] = path
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end.parse!

input_path = @options[:input_path] || File.join(File.dirname(__FILE__), 'input_mis_data.json')
output_path = @options[:output_path] || File.join(File.dirname(__FILE__), 'tmp/output_mis_data.json')

input_data = File.read(input_path)

input_data = JSON.parse(input_data)

File.write(output_path, JSON.pretty_generate(InputStudent.new(**input_data).as_json, indent: "\t"))
