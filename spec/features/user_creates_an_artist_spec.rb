require 'rails_helper'


RSpec.feature "User submits a new artist" do
  scenario "they enter data to create a new artist" do
    artist_name         = "Cult of Luna"
    artist_image_path   = "https://i2.wp.com/www.metalinjection.net/wp-content/uploads/2016/03/cultofluna.jpg?fit=700%2C467"

    visit '/artists'
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    # expect(page).to have_content artist_image_path
  end
  context "User submits invalid data" do
    scenario "they see an error message" do

      artist_image_path   = "https://i2.wp.com/www.metalinjection.net/wp-content/uploads/2016/03/cultofluna.jpg?fit=700%2C467"

      visit artists_path
      click_on "New Artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page).to have_content "Name cannot be left blank"
    end
  end
end
