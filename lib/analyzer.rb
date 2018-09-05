require 'open-uri'
require 'nokogiri'

class Analyzer
	attr_accessor :play_xml, :result, :ignored_speakers

	def initialize(play_url)
	  self.ignored_speakers = %w(ALL)
		self.result = {}
	  xml = open(play_url)
	  self.play_xml = Nokogiri::XML(xml)	  
	end

	def run
		play_xml.search('SPEECH').each do |speech|
	   
	    speaker = speech.search('SPEAKER').text
	    unless ignored_speakers.include? speaker
	      dialogs = speech.search('LINE').count
	      if result[speaker].nil?
		 			result[speaker] = dialogs
	      else
		 			result[speaker] += dialogs
	      end
	    end 
	  end	  
	  result  
	end

	def show_result(output_stream = STDOUT)
		result.each do |speaker, dialogs|
			output_stream.puts "#{dialogs} #{speaker}"
		end
	end
end
