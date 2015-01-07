$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_imgix/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_imgix"
  s.version     = HasImgix::VERSION
  s.authors     = ["Ty Rauber"]
  s.email       = ["tyrauber@mac.com"]
  s.homepage    = "http://github.com/tyrauber/has_imgix"
  s.summary     = "Provides a has_imgix convenience method"
  s.description = "Provides easy migration from paperclip or dragonfly to imgix."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "imgix", "~> 0.3.0"
  s.add_development_dependency "sqlite3"
end
