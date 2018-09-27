require 'pg'

feature 'Viewing bookmarks' do
  scenario "returns all bookmarks" do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://askjeeves.com", title: "Ask Jeeves")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/')

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("Ask Jeeves", href: "http://askjeeves.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end

feature 'Adding bookmarks' do
  scenario 'Add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/')
    click_button('Add Bookmark')
    expect(page).to have_content('Bookmark Manager')
  end
end
