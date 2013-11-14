require 'spec_helper'

describe Fornecedor do

	it { should have_many(:telefones).dependent(:destroy) }
	it { should accept_nested_attributes_for(:telefones).allow_destroy(true) }

end
