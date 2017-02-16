require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :synopsis => "MyText",
      :rent_price => "9.99",
      :is_rented => false
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "textarea#movie_synopsis[name=?]", "movie[synopsis]"

      assert_select "input#movie_rent_price[name=?]", "movie[rent_price]"

      assert_select "input#movie_is_rented[name=?]", "movie[is_rented]"
    end
  end
end
