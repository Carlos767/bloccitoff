require 'spec_helper'

describe TaskItem do
  it { should belong_to(:task) }
end
