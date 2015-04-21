require 'spec_helper'

describe GrainStore::Base do
  it { is_expected.to respond_to(:client) }
  it { is_expected.to respond_to(:get) }
  it { is_expected.to respond_to(:set) }
  it { is_expected.to respond_to(:delete) }
end
