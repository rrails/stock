require_relative "client.rb"
class Broker
  attr_accessor :name, :clients

  def initialize(name)
      @name = name
      @clients = {}
  end

  def add_client(name, initbal)
    @clients[name] = Client.new(name)
    @clients[name].cashbal = initbal
  end

  def list_clients
    puts ("\nThe clients are: ")
    @clients.each { |k,v| v.list_client_details}
  end
end