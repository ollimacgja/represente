class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|

    	t.string "tipo"
    	t.integer "ddd"
    	t.integer "telefone"
    	t.integer :telefonavel_id
      	t.string  :telefonavel_type

      t.timestamps
    end
  end
end
