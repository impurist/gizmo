# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gizmo/version'

Gem::Specification.new do |spec|
  spec.name          = "gizmo"
  spec.version       = Gizmo::VERSION
  spec.authors       = ["Luke Cunningham", "Steven Holloway", "Sam Weller"]
  spec.email         = ["luke@icaruswings.com", "impurist@gmail.com"]
  spec.summary       = %q{Dynamic Page Objects}
  spec.description   = %q{gizmo is a simple page model testing framework used and sponsored by 'realestate.com.au'. The aim of the project is to DRY up your testing assertions by abstracting code that defines your page resulting in a consistent, easy to maintain test suit}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7.2"
  spec.add_development_dependency "rake", "~> 10.3.2"
  spec.add_development_dependency "rspec", ">= 3.1.0"
  spec.add_development_dependency "cucumber", ">= 1.3.17"
  spec.add_development_dependency "capybara", ">= 2.4.3"
  spec.add_development_dependency "selenium-webdriver", ">= 2.43.0"
  spec.add_development_dependency "metric_fu", ">= 4.1.11"
  spec.add_development_dependency "pry", ">= 0.10.0"
  spec.add_dependency "nokogiri", ">= 1.6.3.1"
  spec.add_dependency "activesupport", "~> 4.1.2"
  spec.add_dependency "term-ansicolor", ">= 1.3.0"
  spec.add_dependency "tilt", ">= 2.0.1"

end
