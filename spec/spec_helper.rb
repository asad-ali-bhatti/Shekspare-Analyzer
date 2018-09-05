PROJECT_ROOT = File.expand_path("../..", __FILE__)
ENV['RUBY_ENV'] = 'TEST'
Dir.glob(File.join(PROJECT_ROOT, "lib", "*.rb")).each do |file|
  require file
end

