# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sawaal/version'

Gem::Specification.new do |spec|
  spec.name          = 'sawaal'
  spec.version       = Sawaal::VERSION
  spec.authors       = ['Anshul Verma']
  spec.email         = ['anshul.verma86@gmail.com']
  spec.homepage      = 'https://github.com/anshulverma/sawaal'
  spec.summary       = %q{Helper gem for asking questions on terminal}
  spec.description   = <<-EOS
                          A helper module to allow user to ask a question
                          on the terminal that has multiple choices
  EOS
  spec.license       = 'MIT'

  spec.files         = Dir['Rakefile', '{lib,spec,tasks}/**/*', 'README*', 'LICENSE*', 'CHANGELOG*']
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version     = '>= 1.9.3'
  spec.required_rubygems_version = '>= 1.3.6'

  # development dependencies
  {
      :bundler => '~> 1.6'
  }.each { |dependency, version| spec.add_development_dependency dependency.to_s, version }
end
