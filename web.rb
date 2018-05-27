require 'sinatra/base'
require './utils.rb'
require 'json'

class Web < Sinatra::Base
  
  set :bind, '0.0.0.0'
  
  get '/' do
    unless File.exist?('./data')
      Dir.mkdir('./data')
    end
    current = $tt.attrs.map{|k|
      [k, File.open("./data/#{k}.txt", File::RDONLY | File::CREAT).read]
    }.to_h
    erb :index, :locals => {:tl => $tt.events, :current => current}
  end
  
  get '/delete' do
    set_delete()
    redirect '/'
  end
  
  get '/change' do
    if params['id']
      id = params['id'].to_i
      set(id)
    end
    redirect '/'
  end
end
