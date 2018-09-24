
feature 'Greeting' do
  scenario 'It greets the user with a jovial greeting' do
    visit '/'
    expect(page).to have_content('Hello, world!')
  end
end
