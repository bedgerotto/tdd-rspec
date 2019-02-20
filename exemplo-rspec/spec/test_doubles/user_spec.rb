describe 'Test double' do
  it '--' do
    user = double('User')
    puts user.inspect
    allow(user).to receive(:name).and_return('Bruno')
    allow(user).to receive(:password).and_return('123456')
    user.name
    user.password
  end
end
