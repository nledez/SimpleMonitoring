require 'rubygems'
require 'bundler'
Bundler.setup

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

require 'sinatra'

require './config/database'
require './rb-status'

run RbStatus
