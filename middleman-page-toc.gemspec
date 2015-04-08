# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-page-toc/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-page-toc"
  spec.version       = Middleman::PageToc::VERSION
  spec.authors       = ["Ataru Kodaka"]
  spec.email         = ["ataru.kodaka@gmail.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "http://github.com/atarukodaka/middleman-page-toc"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.license = "MIT"

  spec.add_dependency("middleman-core", "~> 3.2")

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "aruba", "~> 0.6"
  spec.add_development_dependency "therubyracer", "~>0.12"
  spec.add_development_dependency "pry-byebug", "~>3.1"
  spec.add_development_dependency "rb-readline", "~>0.5"
end
