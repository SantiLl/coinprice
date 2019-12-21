require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def home
    bitstamp = open("https://www.bitstamp.net/api/ticker/").string
    bitstamp_doc = JSON.parse(bitstamp)
    @bitstamp_price = bitstamp_doc["last"]

    bitfinex = open("https://api-pub.bitfinex.com/v2/tickers?symbols=tBTCUSD").string
    bitfinex_doc = JSON.parse(bitfinex)
    @bitfinex_price = bitfinex_doc[0][7]

    coinbase = open('https://api.coinbase.com/v2/prices/spot?currency=USD').string
    coinbase_doc = JSON.parse(coinbase)
    @coinbase_price = coinbase_doc["data"]["amount"]
  end

  def about
  end

  private


end
