require 'spec_helper'

RSpec.describe 'Sending shipment orders', :vcr do
  let(:shipment) { decorate(create(:shipment, number: 'H11111111111')) }

  before do
    allow_any_instance_of(ShipQuietLogistics::Documents::ShipmentOrder)
      .to receive(:date_stamp) { '20160329_1010101' }
  end

  it 'sends the shipment' do
    ShipQuietLogistics.send_shipment(shipment)

    expect(shipment.reload).to be_pushed
  end

  context 'an invalid shipment order' do
    let(:shipment) { decorate(create(:shipment, number: 'H22222222222', sku: 'SKU-1')) }

    before do
      allow_any_instance_of(ShipQuietLogistics::Documents::ShipmentOrder)
        .to receive(:date_stamp) { '20160329_2020202' }
    end

    it 'sends the shipment' do
      ShipQuietLogistics.send_shipment(shipment)

      expect(shipment.reload).to be_pushed
    end
  end

  def decorate(shipment)
    ShipmentDecoratorStub.new(shipment)
  end
end
