require './lib/bookmark'

describe Bookmark do
  describe '#all' do
    it "returns all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://www.youtube.com/")
      expect(bookmarks).to include("https://www.facebook.com/")
      expect(bookmarks).to include("http://www.netflix.com")
    end
  end
end
