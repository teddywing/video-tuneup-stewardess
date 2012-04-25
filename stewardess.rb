#!/usr/bin/env ruby

# Thanks to:
# https://gist.github.com/225381

require 'rubygems'
require 'sinatra'

require 'json'


post '/blend/:filename' do
  output = Hash.new
  
  filename = File.join('up', params[:filename])
  datafile = params[:data]
  File.open(filename, 'wb') do |file|
    file.write(datafile[:tempfile].read)
  end
  output['wrote'] = true
  
  content_type :json
  output.to_json
end
