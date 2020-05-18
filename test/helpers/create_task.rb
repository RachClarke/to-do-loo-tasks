def log_in_and_create_task
  login_as users(:Rory)
  visit '/tasks/new'
  fill_in 'Name', with: 'Feed the dog'
  click_on 'Create Task'
end
