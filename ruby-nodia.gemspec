# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruby-nodia/version', __FILE__)

Gem::Specification.new do |s|
	s.name          = 'ruby-nodia'
	s.version       = NoDia::VERSION
	s.platform      = Gem::Platform::RUBY
	s.authors       = ['Jiri Nemecek']
	s.email         = ['nemecek.jiri@gmail.com']
	s.homepage      = ''
	s.description   = %q{diacritic stripper}
	s.summary       = %q{simple module to convert text to ASCII
	                     using Unicode NFD and additional substitutions.}

	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.require_paths = ['lib']

	s.add_dependency 'unicode_utils', '~> 1.0.0'
end
