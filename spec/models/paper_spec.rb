require 'rails_helper'

RSpec.describe Paper, type: :model do
  before :each do
    @title = "Some title"
    @venue = "Some venue"
    @year = 2022

    @paper = Paper.new(title: @title, venue: @venue, year: @year)
  end

  it "requires title to be specified" do
    paper1 = Paper.new(title: nil, venue: @venue, year: @year)
    paper2 = Paper.new(title: "", venue: @venue, year: @year)

    expect(paper1).to_not be_valid
    expect(paper2).to_not be_valid
  end

  it "requires venue to be specified" do
    paper1 = Paper.new(title: @title, venue: nil, year: @year)
    paper2 = Paper.new(title: @title, venue: "", year: @year)

    expect(paper1).to_not be_valid
    expect(paper2).to_not be_valid
  end

  it "requires year to be specified" do
    paper1 = Paper.new(title: @title, venue: @venue, year: nil)
    paper2 = Paper.new(title: @title, venue: @venue, year: "")
    paper3 = Paper.new(title: @title, venue: @venue, year: "not numeric")

    expect(paper1).to_not be_valid
    expect(paper2).to_not be_valid
    expect(paper3).to_not be_valid
  end

  it "has an empty list of authors" do
    expect(@paper.authors).to be_empty
  end
end
