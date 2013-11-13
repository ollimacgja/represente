class AddTotalOrcamentoToOrcamento < ActiveRecord::Migration
  def change
  	add_column :orcamentos, :total_orcamento, :decimal
  end
end
