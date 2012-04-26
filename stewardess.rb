#!/usr/bin/env ruby

# Thanks to:
# https://gist.github.com/225381

require 'rubygems'
require 'sinatra'


post '/blend/:filename' do
  demo = true

  filename = File.join('up', params[:filename])
  datafile = params[:data]
  File.open(filename, 'wb') do |file|
    file.write(datafile[:tempfile].read)
  end
  
  # # Run something like:
  # length = params[:length] # Desired length (in seconds)
  if(demo)
    length = 20
    # puts `python src/earworm.py -v -d #{length} -l #{filename}`
    send_file("*.mp3")
  end 

  # `rm *.mp3`
  # send_file("up/#{filename}")
  # File.delete('up/song.mp3')
end
