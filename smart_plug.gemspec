
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smart_plug/version"

Gem::Specification.new do |spec|
  spec.name          = "smart_plug"
  spec.version       = SmartPlug::VERSION
  spec.authors       = ["Julian Cheal"]
  spec.email         = ["julian.cheal@gmail.com"]

  spec.summary       = %q{Control TP-Link Smart Plugs}
  spec.description   = %q{Control TP-Link HS110 and HS100 Smart Plugs}
  spec.homepage      = "https://github.com/juliancheal/ruby_smart_plugs"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "configatron", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
