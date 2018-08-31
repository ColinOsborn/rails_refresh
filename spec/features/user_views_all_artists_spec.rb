require 'rails_helper'


RSpec.feature "User views all artists" do
  scenario "they see the names of each artist" do
    artists = %w(Palms Kverlertak Riwen).map do |artist_name|
      Artist.create(name: artist_name, image_path: "http://www.drefvet.se/wp-content/uploads/2014/08/riwen.jpg")
    end

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
