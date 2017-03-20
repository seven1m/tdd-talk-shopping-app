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

    context 'when the destination is a PO box' do
      context 'proper case and periods' do
        before do
          subject.address1 = 'P.O. Box 123'
        end

        it 'returns double' do
          expect(subject.shipping).to eq(4)
        end
      end

      context 'lower case with no periods' do
        before do
          subject.address1 = 'po box 123'
        end

        it 'returns double' do
          expect(subject.shipping).to eq(4)
        end
      end
    end
  end

  describe '#tax' do
    context 'when the destination is Bixby' do
      before do
        subject.zip = '74008'
      end

      it 'returns FIXME times the product total' do
        expect(subject.tax).to eq(7.39)
      end
    end

    context 'when the destination is New York City' do
      before do
        subject.zip = '10001'
      end

      it 'returns FIXME times the product total' do
        expect(subject.tax).to eq(6.66)
      end
    end
  end
end
