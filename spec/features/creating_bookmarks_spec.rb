require './app'

feature 'Adding Bookmarks' do
  scenario 'Bookmark form' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.netflix.com'
    fill_in 'title', with: 'Netflix'
    click_button('Submit!')
    
    expect(page).to have_link("Netflix", href: "http://www.netflix.com")
  end

  scenario 'Invalid URL' do
    visit('/bookmarks/new')
    fill_in 'url', with: "netflix.c"
    click_button('Submit!')

    expect(page).not_to have_content("netflix.c")
    expect(page).to have_content('Invalid URL!')
  end
end
