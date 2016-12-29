require 'test_helper'

class GLOCTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GLOC::VERSION
  end

  def test_it_does_something_useful
    assert true # you better believe it!
  end
end
