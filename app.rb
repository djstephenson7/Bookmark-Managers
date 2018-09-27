require './lib/bookmark'
require 'sinatra/base'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid URL!" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end
end
