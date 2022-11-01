require 'rails_helper'

RSpec.describe Author, type: :model do
  before :each do
    @first_name = "Alan"
    @last_name = "Turing"
    @full_name = "Alan Turing"
    @homepage = "http://wikipedia.org/Alan_Turing"
  end

  it "can be created with first name, last name and homepage" do
    author = Author.new(first_name: @first_name, last_name: @last_name, homepage: @homepage)

    expect(author.first_name).to eq(@first_name)
    expect(author.last_name).to eq(@last_name)
    expect(author.homepage).to eq(@homepage)
  end

  it "composes full name from first name and last name" do
    author = Author.new(first_name: @first_name, last_name: @last_name, homepage: @homepage)

    expect(author.name).to eq(@full_name)
  end

  it "requires last_name to be specified" do
    author1 = Author.new(first_name: @first_name, last_name: nil, homepage: @homepage)
    author2 = Author.new(first_name: @first_name, last_name: "", homepage: @homepage)

    expect(author1).to_not be_valid
    expect(author2).to_not be_valid
  end
end
