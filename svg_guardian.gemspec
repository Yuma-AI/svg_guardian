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

  spec.files = Dir["{lib}/**/*.{rb,yml}", "ext/**/*.{rs,toml,lock,rb,ttf}"] + %w[README.md LICENSE.txt Rakefile]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rb_sys", ">= 0.9.110"
end
