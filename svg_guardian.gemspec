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

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/svg_guardian/extconf.rb"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
