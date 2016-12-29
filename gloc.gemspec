# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gloc/version'

Gem::Specification.new do |spec|
  spec.name          = "gloc"
  spec.version       = GLOC::VERSION
  spec.authors       = ["Peter Vandenberk"]
  spec.email         = ["pvandenberk@mac.com"]

  spec.summary       = %q{Not `loc`, not `cloc`, not `tokei`, not `SLOCCOUNT`, ...}
  spec.description   = %q{Simple "lines of code" utility, based on file extensions!}
  spec.homepage      = "https://github.com/pvdb/gloc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-rescue"
end
