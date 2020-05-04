require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Runs chrome without opening up:
  driven_by :headless_chrome

  # Runs and opens chrome:
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
