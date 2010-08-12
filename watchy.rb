#!/usr/bin/env ruby
$VERBOSE = nil

require 'rubygems'
require 'open-uri'
require 'pp'
require 'heroku'

username = 'heroku username'
password = 'heroku password'
heroku   = Heroku::Client.new(username, password)

heroku.list.each do |domain,account|
  
  request = open("http://#{domain}.heroku.com")
  
  if(request.status[0] == "200")
    puts "touched #{domain}.heroku.com"
  else
    raise "domain #{domain}.heroku.com is down"
  end
  
end
