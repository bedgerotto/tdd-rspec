require 'Pessoa'

describe 'Atributos' do
  # before(:each) do
  #   @pessoa = Pessoa.new
  # end

  let(:pessoa) { Pessoa.new }

  it 'have attributes' do
    pessoa.nome = 'Bruno'
    pessoa.idade = 25

    expect(pessoa).to have_attributes(nome: 'Bruno', idade: 25)
    expect(pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 25))
    expect(pessoa).to have_attributes(nome: a_string_starting_with('B'), idade: (a_value >= 25))
  end

  it 'have attributes' do
    pessoa.nome = 'Breno'
    pessoa.idade = 25

    expect(pessoa).to have_attributes(nome: 'Breno', idade: 25)
    expect(pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 25))
    expect(pessoa).to have_attributes(nome: a_string_starting_with('B'), idade: (a_value >= 25))
  end
end
