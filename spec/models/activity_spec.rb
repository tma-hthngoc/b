require 'spec_helper'

describe Activity do
  it "should not allow duplicate names" do
    first = Activity.create name: 'moo'
    second = Activity.create mame: 'miao'
  end
end
