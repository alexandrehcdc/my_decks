defmodule Cards do
  
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do 
      "#{value} of #{suit}"
    end 
  end

  def save deck, filename do
    File.write filename, :erlang.term_to_binary deck
  end

  def load filename do

    case File.read filename do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _err} -> "That file could not be read."
    end
    
  end

  def shuffle deck do
    Enum.shuffle deck
  end

  def contains? deck, hand do
    Enum.member? deck, hand
  end

  def deal deck, hand_size do
    Enum.split deck, hand_size
  end

end
