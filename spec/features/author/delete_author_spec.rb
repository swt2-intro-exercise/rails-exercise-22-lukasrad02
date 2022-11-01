require 'rails_helper'

describe "Delete author link", type: :feature do
  before :each do
    @author = FactoryBot.create :author
  end

  it "should exist for each author" do
    visit authors_path

    Author.all.each do |author|
      expect(page).to have_link("Delete")
    end
  end

  it "should delete the author" do
    visit authors_path

    old_count = Author.count
    
    click_link("Delete")
    
    expect(Author.count).to eq(old_count - 1)
  end
end
