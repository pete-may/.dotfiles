#!/usr/bin/env ruby

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def draw_banner(str)
  prefix = 20 - (str.length / 2.0).ceil
  suffix = 20 - (str.length / 2.0).floor

  print "\n"
  60.times { print '=' }
  print "\n"
  10.times { print '=' }
  prefix.times { print ' ' }
  print str
  suffix.times { print ' ' }
  10.times { print '=' }
  print "\n"
  60.times { print '=' }
  print "\n"
end
