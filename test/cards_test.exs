defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    assert length(Cards.create_deck) == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "dealing should return a hand and the remaning deck" do
    deck = Cards.create_deck
    {hand,remaningDeck} = Cards.deal(deck, 5)
    assert length(hand) == 5
    assert length(remaningDeck) == 15
  end

  test "contains? should return true if card is contained inside deck" do
    deck = Cards.create_deck
    {hand, _remaningDeck} = Cards.deal(deck, 1)
    assert Cards.contains?(deck, Enum.at(hand, 0)) == :true
  end

  test "load file should return an error string in case there's no file" do
    assert Cards.load("inexistent_file") == "That file could not be read."
  end

  test "load file should return content if there is a existent file" do
    refute Enum.empty?(Cards.load("my_deck"))
  end

  test "create_hand should return a list with the given size" do
    {hand, _remaningDeck} = Cards.create_hand(5)
    assert length(hand) == 5
  end

end
