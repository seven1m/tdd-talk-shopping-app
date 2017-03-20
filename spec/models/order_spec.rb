require 'rails_helper'

describe Order do
  subject { orders(:one) }

  describe '#shipping' do
    it 'returns the amount of shipping' do
      expect(subject.shipping).to eq(2)
    end

    context 'when the destination is in a Tulsa zip code' do
      before do
        subject.zip = '74137'
      end

      it 'returns zero' do
        expect(subject.shipping).to eq(0)
      end
    end
  end
end
