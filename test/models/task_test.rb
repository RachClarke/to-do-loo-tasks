require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'should not save without task name' do
    task = Task.new
    assert_not task.save, 'Saved the task without a name'
  end
end
