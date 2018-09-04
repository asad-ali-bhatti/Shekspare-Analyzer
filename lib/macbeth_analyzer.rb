require 'open-uri'
require 'nokogiri'

class MacbethAnalyzer
	attr_accessor :play_xml, :result

	def initialize(play_url)
          self.result = {}		
	  xml = open(play_url)
	  self.play_xml = Nokogiri::XML(xml)	  
	end

	def run 
          play_xml.search('SPEECH').each do |speech|
	   
	    speaker = speech.search('SPEAKER').text
	    if speaker !=  'ALL' 

	      dialogs = speech.search('LINE').count
	      if result[speaker].nil?
		 result[speaker] = dialogs
	      else
		 result[speaker] += dialogs
	      end
	    end 
	  end	  
	  show_result  
	end

	def show_result 
		result.each do |speaker, dialogs|
			 p "#{dialogs} #{speaker}"
		end
	end

end

MacbethAnalyzer.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml').run
