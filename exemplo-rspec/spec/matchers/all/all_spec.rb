# rspec spec -t type:collection

describe [1, 7, 9], 'All', type: :collection do
  it { is_expected.to all(be_odd.and(be_an(Integer))) }
  it { expect(%w[ruby rails]).to all(be_a(String).and(include('r'))) }
end
