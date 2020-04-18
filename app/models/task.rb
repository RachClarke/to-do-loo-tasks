class Task < ApplicationRecord
  validates :name, presence: true
  validates :priority, inclusion: { in: [1, 2, 3],
                                    message: 'should be between 1 and 3' }
end
