require 'test_helper'

describe Advertisement do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:link) }
end
