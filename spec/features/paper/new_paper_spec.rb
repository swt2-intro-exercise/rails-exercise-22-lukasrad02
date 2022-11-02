require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    visit new_paper_path
  end

  it "should have text inputs for a paper's title, venue and year" do
    visit new_paper_path

    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save a new author" do
    visit new_paper_path

    page.fill_in "paper[title]", with: "Some paper"
    page.fill_in "paper[venue]", with: "Some venue"
    page.fill_in "paper[year]", with: 2022

    find("input[type='submit']").click
  end
end
