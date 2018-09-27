require './app'

feature 'Adding Bookmarks' do
  scenario 'Bookmark form' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.netflix.com'
    click_button('Submit!')

    expect(page).to have_content("http://www.netflix.com")
  end
end
