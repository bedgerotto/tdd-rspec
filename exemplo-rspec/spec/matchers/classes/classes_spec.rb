require 'string_nao_vazia'
describe 'Classes' do
  it 'be_instance_of' do
    expect(10).to be_instance_of(Integer) # Exatamente aclasse
  end

  it 'be_kind_of' do
    str = StringNaoVazia.new

    expect(str).to be_kind_of(String) # Pode ser por  herança
    expect(str).to be_kind_of(StringNaoVazia) # Pode ser por  herança
  end

  it 'respond_to' do
    expect('ruby').to respond_to(:size)
    expect('ruby').to respond_to(:length)
  end

  it 'be_a / be_an' do
    str = StringNaoVazia.new

    expect(str).to be_an(String)
    expect(str).to be_an(StringNaoVazia)

    expect(str).to be_a(String)
    expect(str).to be_a(StringNaoVazia)
  end
end