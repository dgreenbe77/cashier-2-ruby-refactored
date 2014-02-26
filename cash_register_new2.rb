
def tally(input, totals, subtotal)
 totals.push(input.to_f)
 subtotal += input.to_f
 subtotal
end

def print_subtotal(subtotal)
puts "Subtotal is: $#{'%.2f' % subtotal}\n"
end

def list_items(totals, subtotal)
  puts "Your items are:"
  totals.each do |item|
    puts "$#{'%.2f' % item}\n"
  end
  print_subtotal(subtotal)
end

def change_calc(subtotal)
  puts "How much money did the customer give you?"
  provided = gets.chomp.to_f
  change = provided - subtotal
  change_due_message(change)
end

def change_due_message(calculated_change)
  if calculated_change >= 0
    puts "Change due is: \n$#{'%.2f' % calculated_change} due \n at #{Time.now.strftime('%m/%d/%y %I:%M %p')}."
  else
    puts "Not enough money given by customer!"
    exit
  end
end

  input = nil
  totals = []
  subtotal = 0
  until input == "done"
    puts "What is the sale price?"
    unless input == "done"
      input = gets.chomp
      subtotal = tally(input, totals, subtotal)
    end
    print_subtotal(subtotal)
  end
  list_items(totals,subtotal)
  change_calc(subtotal)

