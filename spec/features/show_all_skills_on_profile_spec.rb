require 'rails_helper'

describe "Showing skills", type: :feature do
  it "should display all skills" do
    skill = Skill.create!(name: "Ruby")

    visit "/users/show"

    expect(page).to have_content skill.name

    save_and_open_page

    # click_link post.title

    # expect(current_path).to eq(entry_path(post))
    # expect(find("h1")).to have_content(post.title)
    # expect(page).to have_content(post.content)
  end
end