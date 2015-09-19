require "spec_helper"

feature "Creating Projects" do
  scenario "can create a project" do
    project_name = "TextMate 2"

    visit "/"

    click_link "New Project"

    fill_in "Name", with: project_name
    fill_in "Description", with: "A text-editor for OS X"
    click_button "Create Project"

    expect(page).to have_content("Project was successfully created")

    project = Project.where(name: project_name).first
    expect(page.current_url).to eq(project_url(project))

    title = "#{project_name} - Projects - Ticketee"
    expect(page).to have_title(title)
  end
end
