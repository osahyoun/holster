$:.unshift File.expand_path('.') # root
$:.unshift File.dirname(__FILE__) # spec folder

ENV['HOLSTER_ENV'] ||= 'test'

require 'holster'

Bundler.require :test, :development