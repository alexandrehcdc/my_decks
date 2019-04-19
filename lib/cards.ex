defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a conventional deck of cards.
  """
  
  @doc """
    Returns a list of strings representing a deck of cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits  = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Saves a deck in a file with the given filename.
  """
  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  @doc """
    Loads a deck with the given filename.
  """
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _err} -> "That file could not be read."
    end
    
  end

  @doc """
    Shuffles the given deck.

  ## Example
      iex> deck = Cards.create_deck
      iex> deck != Cards.shuffle(deck)
      :true
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if the given hand is contained inside the deck.

  ## Example
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> Cards.contains?(deck, hand)
      :false
  """

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Example 

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Creates a new deck, shuffles it and gives a hand based on the given hand size. 
  """

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
