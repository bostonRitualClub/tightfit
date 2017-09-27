FactoryGirl.define do
  factory :video do
    sequence(:name) { |n| "testVideo ##{n}"}
    sequence(:link) { "http://fhg.javhq.net/flv3/212wx/javhq_Sky_Angel_Volume_118_scene4.mp4" }
  end
end
