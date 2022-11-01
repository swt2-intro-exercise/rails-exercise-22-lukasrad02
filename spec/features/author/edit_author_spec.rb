require 'rails_helper'

describe "Edit author page", type: :feature do
  before :each do
    @author = FactoryBot.create :author

    @new_first_name = "Edsger"
    @new_last_name = "Dijkstra"
    @new_homepage = "http://wikipedia.org/Edsger_Dijkstra"
  end

  it "should exist at 'edit_author_path' and render without error" do
    visit edit_author_path(@author)
  end

  it "should show the author's previous first name, last name and homepage" do
    visit edit_author_path(@author)
    
    expect(page).to have_field("author[first_name]", with: @author.first_name)
    expect(page).to have_field("author[last_name]", with: @author.last_name)
    expect(page).to have_field("author[homepage]", with: @author.homepage)
  end
  
  it "should update the author in tha database with the new values provided" do
    visit edit_author_path(@author)
    
    page.fill_in "author[first_name]", with: @new_first_name
    page.fill_in "author[last_name]", with: @new_last_name
    page.fill_in "author[homepage]", with: @new_homepage

    find("input[type='submit']").click

    @author.reload

    expect(@author.first_name).to eq(@new_first_name)
    expect(@author.last_name).to eq(@new_last_name)
    expect(@author.homepage).to eq(@new_homepage)
  end
end
