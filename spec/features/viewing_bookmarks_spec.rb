require 'pg'

feature 'Viewing bookmarks' do
  scenario "returns all bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES (2,'http://askjeeves.com');")
    connection.exec("INSERT INTO bookmarks VALUES (3,'http://www.google.com');")

    visit('/')

    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://askjeeves.com")
    expect(page).to have_content("http://www.google.com")
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

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.testbookmark.com')
    expect(Bookmark.all).to include 'http://www.testbookmark.com'
  end
end
