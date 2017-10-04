class Video < ActiveRecord::Base
  validates :name, presence: true
  validates :link, presence: true
end
