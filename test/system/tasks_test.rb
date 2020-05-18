require 'test_helper'
require 'application_system_test_case'

class TasksTest < ApplicationSystemTestCase
  # include Warden::Test::Helpers

  test 'lets a signed in user create a task' do
    login_as users(:Rory)

    visit '/tasks/new'
    fill_in 'Name', with: 'Feed the dog'

    click_on 'Create Task'

    assert_equal root_path, page.current_path
    assert_text 'Feed the dog'
  end

  test 'lets a signed in user view a task' do
    login_as users(:Rory)

    visit '/tasks/new'
    fill_in 'Name', with: 'Feed the dog'
    click_on 'Create Task'

    visit '/'

    click_on 'Feed the dog'
    assert_text 'Description'
  end

  test 'lets a signed in user edit a task' do
    login_as users(:Rory)

    visit '/tasks/new'
    fill_in 'Name', with: 'Feed the dog'
    click_on 'Create Task'

    visit '/'

    click_on 'Feed the dog'

    click_on 'Edit this task'

    fill_in('Description', with: 'Give doggo some food!')
    click_on 'Update Task'
    assert_text 'Give doggo some food!'
  end

  test 'lets a signed in user delete a task' do
    login_as users(:Rory)

    visit '/tasks/new'
    fill_in 'Name', with: 'Feed the dog'
    click_on 'Create Task'

    visit '/'

    click_on 'Feed the dog'

    accept_alert do
      click_on 'Delete this task'
    end

    assert_equal root_path, page.current_path
  end
end
