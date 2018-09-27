require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
enable :sessions

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end
  #
  # # get '/bookmarks' do
  # #   erb :'bookmarks/new'
  # # end
  # #
  # # get '/added' do
  # #   erb :bookmark_added
  # # end

  post '/bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    Bookmark.create(url: params['url'])
    redirect '/'
  end
end
