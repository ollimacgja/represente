class CriaUfs < ActiveRecord::Migration
  def change
  	Uf.where(:sigla => "AC").first_or_create
  	Uf.where(:sigla => "AL").first_or_create
  	Uf.where(:sigla => "AP").first_or_create
  	Uf.where(:sigla => "AM").first_or_create
  	Uf.where(:sigla => "BA").first_or_create
  	Uf.where(:sigla => "CE").first_or_create
  	Uf.where(:sigla => "DF").first_or_create
  	Uf.where(:sigla => "ES").first_or_create
  	Uf.where(:sigla => "GO").first_or_create
  	Uf.where(:sigla => "MA").first_or_create
  	Uf.where(:sigla => "MT").first_or_create
  	Uf.where(:sigla => "MS").first_or_create
  	Uf.where(:sigla => "MG").first_or_create
  	Uf.where(:sigla => "PA").first_or_create
  	Uf.where(:sigla => "PB").first_or_create
  	Uf.where(:sigla => "PR").first_or_create
  	Uf.where(:sigla => "PE").first_or_create
  	Uf.where(:sigla => "PI").first_or_create
  	Uf.where(:sigla => "RJ").first_or_create
  	Uf.where(:sigla => "RN").first_or_create
  	Uf.where(:sigla => "RS").first_or_create
  	Uf.where(:sigla => "RO").first_or_create
  	Uf.where(:sigla => "RR").first_or_create
  	Uf.where(:sigla => "SC").first_or_create
  	Uf.where(:sigla => "SP").first_or_create
  	Uf.where(:sigla => "SE").first_or_create
  	Uf.where(:sigla => "TO").first_or_create
  end
end
