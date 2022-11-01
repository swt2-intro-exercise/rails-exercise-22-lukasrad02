require 'rails_helper'

describe "Show author page", type: :feature do
  before :each do
    @author = FactoryBot.create :author
  end

  it "should exist at 'author_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit author_path(@author)
  end

  it "should show the author's first name, last name and homepage" do
    visit author_path(@author)

    expect(page).to have_text(@author.first_name)
    expect(page).to have_text(@author.last_name)
    expect(page).to have_text(@author.homepage)
  end
end
