#!/usr/bin/env ruby

# Usage: dump k8s secrets with
# `kubectl get secret <secret> -o yaml | ./decode64.rb`

require 'yaml'
require 'base64'

require_relative 'draw_banner'

secret = YAML.load(ARGF.read)
return unless secret['data']

draw_banner secret['metadata']['name']

secret['data'].each do |d|
  puts "#{d[0]}: #{d[1]}"
end
