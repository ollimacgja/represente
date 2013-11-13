class RemoveTelefonesAndAlteraEnderecos < ActiveRecord::Migration
  def change
  	remove_column :clientes, :ddd1
  	remove_column :clientes, :telefone1
  	remove_column :clientes, :ddd2
  	remove_column :clientes, :telefone2
  	remove_column :clientes, :ddd_fax
  	remove_column :clientes, :fax

  	remove_column :fornecedors, :ddd1
  	remove_column :fornecedors, :telefone1
  	remove_column :fornecedors, :ddd2
  	remove_column :fornecedors, :telefone2
  	remove_column :fornecedors, :ddd_fax
  	remove_column :fornecedors, :fax
  	
  	remove_column :clientes, :municipio_id
  	remove_column :fornecedors, :municipio_id

  	add_column	:fornecedors, :municipio, :string
  	add_column	:clientes, :municipio, :string

  end
end
