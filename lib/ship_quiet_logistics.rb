require 'aws-sdk'
require 'nokogiri'
require 'spree_core'
require 'gentle'

require 'ship_quiet_logistics/version'
require 'ship_quiet_logistics/engine'
require 'ship_quiet_logistics/api'
require 'ship_quiet_logistics/documents'
require 'ship_quiet_logistics/commands'
require 'ship_quiet_logistics/downloader'
require 'ship_quiet_logistics/event_message'
require 'ship_quiet_logistics/messages'
require 'ship_quiet_logistics/processor'
require 'ship_quiet_logistics/receiver'
require 'ship_quiet_logistics/sender'
require 'ship_quiet_logistics/uploader'
require 'ship_quiet_logistics/version'

AWS.config(access_key_id: ENV['QUIET_AWS_ACCESS_KEY'],
           secret_access_key: ENV['QUIET_AWS_SECRET_KEY'])

module ShipQuietLogistics
  def self.send_shipment(shipment)
    Commands::SendShipment.(shipment)
  end

  def self.process_shipments
    client = Gentle::Client.new(configuration.credentials)
    blackboard = Gentle::Blackboard.new(client)
    queue = Gentle::Queue.new(client)

    Commands::ProcessShipments.(blackboard: blackboard, queue: queue)
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield configuration
  end

  class Configuration
    attr_accessor :outgoing_bucket,
                  :outgoing_queue,
                  :incoming_bucket,
                  :incoming_queue,
                  :inventory_queue,
                  :business_unit,
                  :client_id,
                  :process_shipment_handler,
                  :error_message_handler

    def credentials
      {
        access_key_id: ENV['QUIET_AWS_ACCESS_KEY'],
        secret_access_key: ENV['QUIET_AWS_SECRET_KEY'],
        client_id: client_id,
        business_unit: business_unit,
        warehouse: 'ALL',
        buckets: {
          to: outgoing_bucket,
          from: incoming_bucket
        },
        queues: {
          to: outgoing_queue,
          from: incoming_queue,
          inventory: inventory_queue
        }
      }
    end
  end
end
