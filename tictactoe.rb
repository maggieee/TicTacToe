
@board = [1,2,3,
		 4,5,6,
		 7,8,9]

@board_full = false
@winner_present = false

@player = 'Player One'

@winning_sequence_one = ['X','X','X']
@winning_sequence_two = ['O','O','O']

def start_turn
	
	check_if_winner_present
	check_if_board_full

	if @player == 'Player One'
		puts 'It\'s time for Player One to take a turn.'
	elsif @player == 'Player Two'
		puts 'Your turn, Player Two.'
	end
end
		

def change_turn

	check_if_winner_present
	check_if_board_full

	if @player == 'Player One'
		@player = 'Player Two'
	elsif @player == 'Player Two'
		@player = 'Player One'
	end
	puts "Changed turn to #{@player}."
end

def get_place

@cute_board = "\n 
			   #{@board[0]} | #{@board[1]} | #{@board[2]}  \n
			  ---------- \n
			   #{@board[3]} | #{@board[4]} | #{@board[5]}  \n
			  ---------- \n
			   #{@board[6]} | #{@board[7]} | #{@board[8]}  "

	# add something to check if board is already full 
	
		puts "Where would you like to make your move? Please state place as an integer, 1-9. The current state of the board is: #{@cute_board}"

		@place = gets.chomp.to_i

		intended_place = @board[@place - 1]

		unless [1,2,3,4,5,6,7,8,9].include? @place
			puts 'Please say the position you\'d like to make your move as an integer, 1-9.'
		
			get_place 

		else
			if intended_place == 'X' || intended_place == 'O'
				puts 'Sorry dude, that spot\'s already taken.'
				get_place
			end

		end



	# end

end

def make_move

	if @player == 'Player One'
		@board[@place - 1] = 'X'
	elsif @player == 'Player Two'
		@board[@place - 1] = 'O'
	else 
		puts 'Hmmm...something has gone amiss with our player settings. Game Ova.'
		exit
	end

end

def check_if_winner_present

	winning_combos = 	[
							# horizontal winning combos
							 @board[0..2], 
							 @board[3..5],
							 @board[6..8],

							 # vertical winning combos
							 [@board[0],@board[3],@board[6]],
							 [@board[1],@board[4],@board[7]],
							 [@board[2],@board[5],@board[8]],

							 # diagonal winning combos
							 [@board[0],@board[4],@board[8]],
							 [@board[2],@board[4],@board[6]]
																]

	# puts "#{@cute_board}"

	if winning_combos.include?(@winning_sequence_one)
		@winner_present = true
		puts 'No more turns....Player One won the game. Wooo!'
		exit
	elsif winning_combos.include?(@winning_sequence_two)
		@winner_present = true
		puts 'No more turns...Player Two won the game, Wooo!'
		exit
	else
		@winner_present = false
	end

end

def check_if_board_full
	new_array = []

	@board.each do |x|
		
		if x == 'X' || x == 'O'
			new_array.push('taken')
		else 
			new_array.push('open')
		end
	end
		
	# puts new_array

	if new_array.include? 'open'
		@board_full = false
		# puts 'We still got free places—play away!'
	else
		@board_full = true
		puts 'The board is full, and the game is ova without a winner. :<'
		exit
	end

end

def tic_tac_toe

	while true

		# puts @board_full
		# puts @winner_present

		while @board_full == false && @winner_present == false
			# puts @board_full
			# puts @winner_present
			start_turn
			get_place
			make_move
			change_turn
		end

		# if @winner_present
		# 	puts 'woo'

		# elsif @board_full
		# 	puts 'boooo'

		# end
			

	end

end

tic_tac_toe
