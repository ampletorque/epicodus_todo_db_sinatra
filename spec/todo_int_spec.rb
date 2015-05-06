require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('description', :with =>'Epicodus Work')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end

describe('view all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    list = List.new({:name => 'Epicodus Homework', :id => nil})
    list.save()
    visit('/')
    click_link('View All Lists')
    expect(page).to have_content(list.name)
  end
end

describe('seeing details for a single list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save()
    test_task = Todo.new({:description => "learn SQL", :list_id => test_list.id(), :id => nil})
    test_task.save()
    visit('/lists')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end

describe('adding tasks to a list', {:type => :feature}) do
  it('allows a user to add a task to a list') do
    test_list = List.new({:name =>'School stuff', :id => nil})
    test_list.save()
    visit("/tasks/new/#{test_list.id()}")
    fill_in("description", {:with => "learn SQL"})
    click_button("Add task")
    expect(page).to have_content("Success")
  end
end


# describe('Test adding tasks', {:type => :feature}) do
#   it('Displays a user''s task after adding it') do
#     visit('/')
#     fill_in('description', :with => "rub kittycat")
#     click_button('Add task')
#     click_link("Back to main tasks screen.")
#     expect(page).to have_content("rub kittycat")
#   end
# end
#
# describe('Test clearing tasks', {:type => :feature}) do
#   it('clears a user''s task after it''s added') do
#     visit('/')
#     fill_in('description', :with => "scratch itch")
#     click_button('Add task')
#     click_link("Back to main tasks screen.")
#     expect(page).to have_content("scratch itch")
#     click_button('Clear Tasks')
#     click_link("Back to main tasks screen.")
#     expect(page).to_not have_content("scratch itch")
# end
# end
