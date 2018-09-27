require './lib/bookmark'
require './app'

describe Bookmark do
  describe '#.all' do
    it "returns all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://askjeeves.com", title: "Ask Jeeves")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first

      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq "Makers Academy"
      expect(bookmark.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test')

      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Test'
    end

    it 'does not create a bookmark if url is invalid' do
      bookmark = Bookmark.create(url: 'www.testbookmark.c', title: 'Test')

      expect(bookmark).not_to be_a Bookmark
    end
  end
end
