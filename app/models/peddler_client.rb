class PeddlerClient

  def initialize
    @auth_hash = {
    marketplace_id:  ENV['MARKETPLACE_ID'],
    merchant_id:  ENV['SELLER_ID'],
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY']
    }
  end

  def fi
    client = MWS.fulfillment_inventory(@auth_hash)
    parser = client.list_inventory_supply(
      seller_skus: ['A0-HG', 'AL-HE'])
    parser.parse
    binding.pry
  end

  def testapi
    client = MWS.orders(@auth_hash)
    parser = client.get_service_status
    parser.parse
  end

end
