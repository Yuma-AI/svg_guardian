# frozen_string_literal: true

require "test_helper"

class TestSvgGuardian < Minitest::Test
  def test_it_sanitizes_svgs
    dirty_svg = File.read(File.join(__dir__, "support/files/dirty.xml"))
    clean_svg = File.read(File.join(__dir__, "support/files/clean.xml"))

    assert_equal clean_svg, SvgGuardian.sanitize(dirty_svg)
  end

  def test_it_invalid_svg
    invalid_svg = File.read(File.join(__dir__, "support/files/invalid.xml"))
    exception = assert_raises SvgGuardian::SanitizeError do
      SvgGuardian.sanitize(invalid_svg)
    end
    assert_equal "XML parsing error", exception.message
  end
end
