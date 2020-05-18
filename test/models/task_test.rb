require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'should not save without task name' do
    task = Task.new
    assert_not task.save, 'Saved the task without a name'
  end

  test 'should not save if priority is not between 1 and 3' do
    task = Task.new(name: 'Walk the dog', priority: 5)
    assert_not task.save, 'Saved the task where priority is not between 1 and 3'
  end

  test 'should save a valid task (name, description, deadline and priority)' do
    task = Task.new(name: 'Walk the dog',
                    description: 'Take doggo to the park.',
                    deadline: Date.today,
                    priority: 3)
    assert task.save, 'Did not save a valid task'
  end
end
