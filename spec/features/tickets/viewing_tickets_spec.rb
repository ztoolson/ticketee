require 'spec_helper'

feature "Viewing tickets" do
  let!(:textmate_2) { FactoryGirl.create(:project, name: "TextMate 2")}
  let!(:internet_explorer) { FactoryGirl.create(:project, name: "Internet Explorer") }
  let!(:ticket1) {
    FactoryGirl.create(
      :ticket,
      project: textmate_2,
      title: "Make it shiny!",
      description: "Gradients! Starbursts! Oh my!",
      user: user)
  }
  let!(:ticket2) {
    FactoryGirl.create(
      :ticket,
      project: internet_explorer,
      title: "Standards Compliance",
      description: "Isn't a joke.",
      user: user)
  }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as!(user)
    visit "/"
  end

  scenario "Viewing tickets for a given project" do
    click_link "TextMate 2"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end
  end
end
