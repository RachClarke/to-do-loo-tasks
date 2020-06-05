require 'net/http'
require 'json'

class Task < ApplicationRecord
  validates :name, presence: true
  validates :priority, inclusion: { in: [1, 2, 3],
                                    message: 'should be between 1 and 3' }

  after_save do
    if self.done && !self.gif_id
      set_gif_id
    end
  end

  def set_gif_id
    url = 'http://api.giphy.com/v1/gifs/random?api_key=8UMJv9dvAP1gQw3HVVbutU4suAhblZmc&limit=5'
    response = Net::HTTP.get_response(URI.parse(url))
    buffer = response.body
    result = JSON.parse(buffer)
    self.gif_id = result["data"]["id"]
  end
end
