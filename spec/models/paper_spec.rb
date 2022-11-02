require 'rails_helper'

RSpec.describe Paper, type: :model do
  before :each do
    @title = "Some title"
    @venue = "Some venue"
    @year = 2022
  end

  it "requires title to be specified" do
    paper1 = Paper.new(title: nil, venue: @venue, year: @year)
    paper2 = Paper.new(title: "", venue: @venue, year: @year)

    expect(paper1).to_not be_valid
    expect(paper2).to_not be_valid
  end
end
