require 'spec_helper'

describe "Editing todo lists" do
  #this will create a todo list and assign it to variable for me :)
  let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }
  def update_todo_list(options={})
    options[:title] ||= "My to list"
    options[:description] ||= "This is my todo list."

    todo_list = options[:todo_list]

    within "#todo_list_#{todo_list.id}" do
      click_link "Edit"
    end

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Update Todo list"
  end

  it "updates a todo list successfully  with correct information" do
    update_todo_list todo_list: todo_list,
    title: "New title",
    description: "New description"

    todo_list.reload

    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}"do
    click_link "Edit"
  end

  fill_in "Title", with: "New title"
  fill_in "Description", with: "New description"
  click_button "Update Todo list"

  expect(page).to have_content("Todo list was successfully updated")
  expect(todo_list.title).to eq("New title")
  expect(todo_list.description).to eq ("New description")
end
# update, reload and make sure it displays an error for each of defferent ones and it's still the same.
it "displays an error with no title" do
  update_todo_list todo_list: todo_list, title: ""
  title = todo_list.title #saving the title
  todo_list.reload #reload from data base
  expect(todo_list.title).to eq(title) #make sure it is still the same
  expect(page). to have_content("error")
end

it "displays an error with description" do
  update_todo_list todo_list: todo_list, description: ""
  expect(page). to have_content("error")
end
it "displays an error with too short a description" do
  update_todo_list todo_list: todo_list, description: "hi"
  expect(page). to have_content("error")
end
end
