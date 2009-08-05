require "minitest/unit"
require "osx/multitouch"

module OSX
  class MultiTouchTest < MiniTest::Unit::TestCase
    def test_sanity
      OSX::MultiTouch.start
      sleep 3
      OSX::MultiTouch.stop
    end
  end
end
