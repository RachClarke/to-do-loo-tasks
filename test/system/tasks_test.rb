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
end
