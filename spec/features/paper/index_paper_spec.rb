require 'rails_helper'

describe "Paper index page", type: :feature do
  before :each do
    @paper = FactoryBot.create :paper
    @all_papers = Paper.all
  end

  it "should exist at 'papers_path' and render without error" do
    visit papers_path
  end

  it "should have a link for each paper to edit it" do
    visit papers_path

    @all_papers.each do |paper|
      expect(page).to have_link("Edit this paper", href: edit_paper_path(paper))
    end
  end
end
