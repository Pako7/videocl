require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "MyString",
      :synopsis => "MyText",
      :rent_price => "9.99",
      :is_rented => false
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "textarea#movie_synopsis[name=?]", "movie[synopsis]"

      assert_select "input#movie_rent_price[name=?]", "movie[rent_price]"

      assert_select "input#movie_is_rented[name=?]", "movie[is_rented]"
    end
  end
end
