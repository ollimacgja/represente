class AddUserIdToClientesAndFornecedores < ActiveRecord::Migration
  def change

  	add_column :clientes, :user_id, :integer
  	add_column :fornecedors, :user_id, :integer
  end
end
