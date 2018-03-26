require 'active_support'
require 'active_support/core_ext'
require 'nokogiri'
require 'optparse'
require 'json'

ARGV << '-h' if ARGV.empty?
options = {}
fileName = nil

begin
  OptionParser.new do |opts|
  	opts.banner = "Commands:"
  	opts.on('-f', '--xml [file]', '# Load a XML file') { |o|
      options[:file] = o}
    opts.on('-n', '--name name', '# Searches for a five name in the file.') { |file|
      options[:name] = file}
	opts.on('--ip IP', '# Searches file for a given ip address') {|ip|
		options[:ip] = ip}
	opts.on('-h','# Describe available commands or one specific command') do
		puts opts
		exit
	end
  end.parse!

	if options.has_key?(:file)
		fileName = options[:file]
		puts "test1"
	else 
		fileName = "emails.xml"
		if !File.exists?(fileName)
			puts "Provided file does not exist in the directory!"
		end
	end
		
	puts fileName
	doc = Nokogiri::XML(open(fileName))
	nodes = doc.xpath('//record')

	

end