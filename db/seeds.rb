User.destroy_all

u1 = User.create :email => 'testguy@ga.co', :name => 'testguy', :password => 'chicken'

puts "Users created: #{User.count}"

Excerpt.destroy_all

e1 = Excerpt.create :content => '“My Friend.—Welcome to the Carpathians. I am anxiously expecting you. Sleep well to-night. At three to-morrow the diligence will start for Bukovina; a place on it is kept for you. At the Borgo Pass my carriage will await you and will bring you to me. I trust that your journey from London has been a happy one, and that you will enjoy your stay in my beautiful land."', :user_id => u1.id

e2 = Excerpt.create :content => 'With time, society started building up again and people were now living in walled strongholds and fringe towns across the land.', :user_id => u1.id

e3 = Excerpt.create :content => 'He lashed the horses unmercifully with his long whip, and with wild cries of encouragement urged them on to further exertions.', :user_id => u1.id

e4 = Excerpt.create :content => "By this time I had finished my supper, and by my host’s desire had drawn up a chair by the fire and begun to smoke a cigar which he offered me, at the same time excusing himself that he did not smoke. I had now an opportunity of observing him, and found him of a very marked physiognomy.", :user_id => u1.id

e5 = Excerpt.create :content => "The situation had just spiraled completely beyond her control and she was too ill to deal with it.", :user_id => u1.id

e6 = Excerpt.create :content => "A hop, skip and a jump was all it took to reach the end of the road.", :user_id => u1.id

e7 = Excerpt.create :content => "Twas a warm, yet lonely spring morning.", :user_id => u1.id


puts "Excerpts created: #{Excerpt.count}"

Novel.destroy_all

n1 = Novel.new
n1.excerpts << e5 << e4 << e1
n1.content = n1.excerpts.map{|excerpt| excerpt[:content]}.join ' '
n1.cover = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgdtcO5X1kJ7wvSgpuRHsY1dLxR6Pg4OkDmQ&usqp=CAU'
n1.title = 'Down Comes the Night'
n1.blurb = "The guy spiraled pretty bad, and it was pretty late."
n1.user = u1
n1.save

n2 = Novel.new
n2.excerpts << e7 << e4 << e1
n2.content = n2.excerpts.map{|excerpt| excerpt[:content]}.join ' '
n2.cover = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLoTKWO8Tt07PYD-lLSZpHp1NlLpb0dR4SRzHsd2DsizFBp8wxDvwSD7noPkGUHqFxNXk&usqp=CAU'
n2.title = 'Greetings from Nowhere'
n2.blurb = "A woman is greeted early in the morning by a mysterious man..."
n2.user = u1
n2.save

puts "Novels created: #{Novel.count}"



