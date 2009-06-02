require "rubygems"
require "hoe"

require "./lib/osx/multitouch/version.rb"

HOE = Hoe.new "osx-multitouch", OSX::MultiTouch::VERSION do |p|
  p.developer "John Barnette", "jbarnette@rubyforge.org"

  p.url              = "http://github.com/jbarnette/osx-multitouch"
  p.history_file     = "CHANGELOG.rdoc"
  p.readme_file      = "README.rdoc"
  p.extra_rdoc_files = [p.readme_file]
  p.test_globs       = %w(test/**/*_test.rb)
  p.testlib          = :minitest

  desc               = IO.read(p.readme_file).split("\n\n")[1]
  p.description      = desc.split(/\s*\n\s*/).join(" ")
  p.summary          = p.description.split(/\.\s+/).first + "."
end
