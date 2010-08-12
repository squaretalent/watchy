#!/opt/ruby/current/bin ruby
$VERBOSE = nil

require 'rubygems'
require 'open-uri'
require 'pp'
require 'heroku'

username = 'heroku username'
password = 'heroku password'
heroku   = Heroku::Client.new(username, password)

heroku.list.each do |domain,account|
  domain = open("http://#{domain}.heroku.com")
  unless(domain.status[0] == "200")
    raise 'domain is down'
  end
end
