

  feature "view bookmarks" do
    scenario "bookmark views" do
      visit "/bookmarks"
      expect(page).to have_content("https://www.youtube.com/")
      expect(page).to have_content("https://www.facebook.com/")
      expect(page).to have_content("http://www.netflix.com")
    end
  end
