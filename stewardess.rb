#!/usr/bin/env ruby

# Thanks to:
# https://gist.github.com/225381

require 'rubygems'
require 'sinatra'

require 'json'


post '/blend/:filename' do
  filename = File.join('up', params[:filename])
  datafile = params[:data]
  File.open(filename, 'wb') do |file|
    file.write(datafile[:tempfile].read)
  end
  
  send_file('up/thefile.jpg')
end
