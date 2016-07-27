require_relative 'capitals'
states = $states.shuffle
continue = "Y"
states.each do |state|
  state[:correct] = 0
  state[:incorrect] = 0
end
puts "Do YOU know your state capitals? Let's find out."
while continue == "Y"
  score = 0
  total_states = 0
  states.each do |state|
    puts "What is the capital of #{state[:name]}?"
    hint = state[:capital][0, 3]
    your_guess = gets.chomp.upcase
    total_states += 1
    if your_guess == "HINT"
      puts "Hint: #{hint}"
      your_guess = gets.chomp.upcase
    end
    if your_guess == state[:capital].upcase
      puts "Correct!"
      score += 1
      state[:correct] += 1
    else
      puts "Incorrect! The correct answer is #{state[:capital]}."
      state[:incorrect] += 1
    end
    if total_states < states.length
      puts "You currently have #{score} points out of a potential #{total_states}."
    end
  end
  puts "Your final score is #{score} points out of a potential #{total_states}!"
  puts "Do you want to play again? Y/N"
  continue = gets.chomp.upcase
  states = states.shuffle
  states.sort_by! do |state|
    state[:incorrect]
  end
  states = states.reverse
end
