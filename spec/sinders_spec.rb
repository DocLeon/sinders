require 'spec_helper'

describe Sinders do
  let(:data) { { key: 'value' } }
  let(:till_midnight) { 0 }

  it 'has a version number' do
    expect(Sinders::VERSION).not_to be nil
  end

  def create_new_instance
    @id = subject.transforms(data, till_midnight) do |data|
      data.each do |key, _value|
        data.tap { |d| d[key].upcase! }
      end
    end
  end

  describe '.get(id)' do
    context 'before midnight (before time expired)' do
      it 'returns the transformed data' do
        allow(Sinders).to receive(:check)
        create_new_instance
        expect(subject.get(@id)).to eq(key: 'VALUE')
      end
    end
  end
end
