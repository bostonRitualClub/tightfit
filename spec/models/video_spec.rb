require 'test_helper'

describe Video do

  # Associations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:link) }

end
