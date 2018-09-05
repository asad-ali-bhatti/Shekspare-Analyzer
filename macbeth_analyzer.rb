require_relative  'lib/analyzer'

analyzer = Analyzer.new('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml')
analyzer.run
analyzer.show_result