# frozen_string_literal: true

require_relative "lib/svg_guardian/version"

Gem::Specification.new do |spec|
  spec.name = "svg_guardian"
  spec.version = SvgGuardian::VERSION
  spec.authors = ["Alex Beznos"]
  spec.email = ["alex@yuma.ai"]

  spec.summary = "Tiny wrapper around svg-hush to sanitize SVGs."
  spec.homepage = "https://github.com/Yuma-AI/svg_guardian"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.required_rubygems_version = ">= 3.3.11"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Yuma-AI/svg_guardian"

  spec.extensions = ["ext/svg_guardian/extconf.rb"]

  spec.files = Dir["{lib,ext}/**/*", "LICENSE", "README.md", "Cargo.*"]
  spec.files.reject! { |f| File.directory?(f) }
  spec.files.reject! { |f| f =~ /\.(dll|so|dylib|lib|bundle)\Z/ }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
