  # sum = cards.reduce(0) do |total, card|
  #   total += card_hash.fetch(card[1], 0)
  # end

  ##############################################################


  # def calculate_sum(cards, card_hash, target = 21)
  #   sum = cards.sum { |card| card_hash.fetch(card[1], 0) }
  #   cards.select { |card| card[1] == 'A' }.count.times do
  #     if sum < (target - 10)
  #        sum += 11
  #     else 
  #       sum += 1
  #     end
  #   end
  #   sum
  # end

  ##############################################################

  # def calculate_sum(cards, card_hash, target = 21)
  #   sum = cards.sum { |card| card_hash.fetch(card[1], 0) }
  #   cards.count { |card| card[1] == 'A' }.times do |(total, _), _|
  #     if total < (target - 10)
  #       total += 10
  #     else
  #       total += 1
  #     end
  #   end
  #   total
  # end

  ##############################################################

  def display_hand(cards, turn = 'player', start = false)
    player = turn == 'player' ? 'Player' : 'Dealer'
  
    if start
      puts "Player's hand is:\n\t#{cards[0].join("\n\t")}\n\n"
      puts "Dealer's hand is:\n\t#{cards[1][0]}\n\t?\n\n"
    else
      puts "#{player}'s hand is:\n\t#{cards[0].join("\n\t")}\n\n"
    end
  end