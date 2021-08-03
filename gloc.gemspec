lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gloc/version'

Gem::Specification.new do |spec|
  spec.name          = GLOC::NAME
  spec.version       = GLOC::VERSION
  spec.authors       = ['Peter Vandenberk']
  spec.email         = ['pvandenberk@mac.com']

  spec.summary       = 'Not `loc`, not `cloc`, not `tokei`, not `SLOCCOUNT`, ...'
  spec.description   = 'Simple "lines of code" utility, based on file extensions!'
  spec.homepage      = 'https://github.com/pvdb/gloc'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = ['>= 2.6.0', '< 2.7.0']

  spec.add_dependency 'rainbow', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'minitest', '~> 5.14'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'pry-rescue', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.18'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.14'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'
end
