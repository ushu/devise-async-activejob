# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "devise-async-activejob"
  spec.version       = "0.0.3"
  spec.authors       = ["Aurélien Noce"]
  spec.email         = ["aurnoce@gmail.com"]
  spec.summary       = %q{An ActiveJob backend for devise-async.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rails", "~> 4.1"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "globalid", "~> 0.3"
  spec.add_development_dependency "activejob", "0"

  spec.add_dependency "devise", "~> 3"
  spec.add_dependency "devise-async", "~> 0.9"
end
