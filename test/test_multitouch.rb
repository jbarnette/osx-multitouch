require "minitest/autorun"
require "osx/multitouch"

class TestMultiTouch < MiniTest::Unit::TestCase
  def test_sanity
    OSX::MultiTouch.start
    sleep 3
    OSX::MultiTouch.stop
  end
end
