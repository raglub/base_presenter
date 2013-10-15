# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'base_presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "base_presenter"
  spec.version       = BasePresenter::VERSION
  spec.date          = '2013-10-15'
  spec.authors       = ["Michał Szyma"]
  spec.email         = ["raglub.ruby@gmail.com"]
  spec.description   = %q{The gem adds "Presenter" functionality into Rails application}
  spec.summary       = %q{The gem adds "Presenter" functionality into Rails application}
  spec.homepage      = "https://github.com/raglub/base_presenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rails', ">= 3.0.0"
end
