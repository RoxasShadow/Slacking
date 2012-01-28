Kernel.load 'lib/slacking/version.rb'

Gem::Specification.new { |s|
	s.name          = 'slacking'
	s.version       = Slacking.version
	s.author        = 'Giovanni Capuano'
	s.email         = 'webmaster@giovannicapuano.net'
	s.homepage      = 'http://www.giovannicapuano.net'
	s.platform      = Gem::Platform::RUBY
	s.summary       = 'A social network post sharer.'
	s.description   = 'You give it a message, and it will share it in each social network you want.'
	s.require_paths = ['lib']
	s.files         = Dir.glob('lib/**/*.rb')
	s.executables   = 'slacking'
	s.add_dependency 'json-stream'
	s.add_dependency 'twitter'
	s.add_dependency 'koala'
}
