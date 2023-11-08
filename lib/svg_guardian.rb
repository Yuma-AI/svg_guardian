# frozen_string_literal: true

begin
  # load the precompiled extension file
  ruby_version = /(\d+\.\d+)/.match(::RUBY_VERSION)
  require_relative "svg_guardian/#{ruby_version}/svg_guardian"
rescue LoadError
  require "svg_guardian/svg_guardian"
end

require_relative "svg_guardian/version"

module SvgGuardian
  class SanitizeError < StandardError; end
end
