require "minitest/unit"
require "osx/multitouch"

module OSX
  class MultiTouchTest < MiniTest::Unit::TestCase
    def test_sanity
      OSX::MultiTouch.new.go
    end
  end
end
