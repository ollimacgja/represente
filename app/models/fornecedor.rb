class Fornecedor < ActiveRecord::Base

	has_many :telefones, as: :telefonavel, :dependent => :destroy
	accepts_nested_attributes_for :telefones, allow_destroy: true

end
