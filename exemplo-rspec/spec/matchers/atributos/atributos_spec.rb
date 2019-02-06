require 'Pessoa'

describe 'Atributos' do
  it 'have attributes' do 
    pessoa = Pessoa.new
    pessoa.nome = 'Bruno'
    pessoa.idade = 25

    expect(pessoa).to have_attributes(nome: 'Bruno', idade: 25)
    expect(pessoa).to have_attributes(nome: starting_with('B'), idade: (be >= 25))
    expect(pessoa).to have_attributes(nome: a_string_starting_with('B'), idade: (a_value >= 25))
  end
end
