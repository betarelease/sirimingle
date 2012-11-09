# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-sirimingle"
  s.version     = "0.0.2" 
  s.platform    = Gem::Platform::RUBY 
  s.authors     = ["betarelease"]
  s.email       = ["sudhindra.r.rao@gmail.com"]
  s.homepage    = "http://github.com/betarelease/sirimingle"
  s.summary     = %q{A Siri Plugin for Mingle}
  s.description = %q{Siri plugin to interact with Mingle}

  s.rubyforge_project = "siriproxy-sirimingle"

  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.require_path = "lib"

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "crack"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "mingle_party"
end
