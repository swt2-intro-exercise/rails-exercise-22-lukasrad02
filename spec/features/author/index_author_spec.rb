require 'rails_helper'

describe "Author index page", type: :feature do
  before :each do
    # Create some authors to test the table
    FactoryBot.create :author
    FactoryBot.create :author
    FactoryBot.create :author

    @all_authors = Author.all
  end

  it "should exist at 'authors_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path
  end

  it "should show a table with columns name and homepage" do
    visit authors_path

    expect(page).to have_selector("table tr th", text: "Name")
    expect(page).to have_selector("table tr th", text: "Homepage")
  end

  it "should show name and homepage of all authors and link to their details page" do
    visit authors_path

    @all_authors.each do |author|
      expect(page).to have_text(author.name)
      expect(page).to have_text(author.homepage)
      expect(page).to have_link(nil, href: author_path(author))
    end
  end

  it "should contain a link to add a new author" do
    visit authors_path

    expect(page).to have_link("Add author", href: new_author_path)
  end
end
