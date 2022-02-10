require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

battledroids = Game.new("Battledroids of Ooo")

battledroids.play
battledroids.add_players(player1)
battledroids.add_players([player3, player2])
battledroids.play(2)


