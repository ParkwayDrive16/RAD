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
	else 
		fileName = "emails.xml"
		if !File.exists?(fileName)
			puts "Provided file does not exist in the directory!"
		end
	end
		
	puts fileName
	doc = Nokogiri::XML(open(fileName))
	nodes = doc.xpath('//record')
	results = []
	resultsFiltered = []
	test1 = nodes[0]
	# first_names = nodes.xpath("//first_name").text

	# puts first_names

	if options.has_key?(:name)
		i = 0
		nodes.size.times do
			if nodes[i].xpath('first_name').text == options[:name]
				results.push(nodes[i])
				# puts results
			end
			i+=1
		end
	end

	if options.has_key?(:ip) and results.size != 0
		i = 0
		results.size.times do
			if results[i].xpath('ip_address').text == options[:ip]
				resultsFiltered.push(results[i])
				# puts resultsFiltered
			end
			i+=1
		end
	elsif resultsFiltered = results
	end
	# puts JSON.pretty_generate(Hash.from_xml(nodes.to_xml))
	# puts "<record><id>1</id><first_name>Adiana</first_name><last_name>Paulat</last_name><email>apaulat0@technorati.com</email><gender>Female</gender><ip_address>216.250.245.57</ip_address><send_date>2017-05-17T23:04:27Z</send_date><email_body>​</email_body><email_title>Up-sized</email_title></record>"
	# puts JSON.pretty_generate(Hash.from_xml('<record><id>1</id><first_name>Adiana</first_name><last_name>Paulat</last_name><email>apaulat0@technorati.com</email><gender>Female</gender><ip_address>216.250.245.57</ip_address><send_date>2017-05-17T23:04:27Z</send_date><email_body>​</email_body><email_title>Up-sized</email_title></record>'))

	resultsFiltered.each do |elem|
		# puts JSON.pretty_generate(Hash.from_xml(elem.to_xml))
		puts JSON.pretty_generate(Hash.from_xml(elem.to_xml))
	end
	

end