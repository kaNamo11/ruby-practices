# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.slice(0..9).each_with_index do |frame, i|
  point += if i == 9 && frames[i + 2]
             frame.sum + frames[i + 1][0] + frames[i + 2][0]
           elsif i == 9 && frames[i + 1]
             frame.sum + frames[i + 1].sum
           elsif i < 9 && frame[0] == 10 && frames[i + 1][0] == 10 && frames[i + 2][0]
             frame.sum + frames[i + 1][0] + frames[i + 2][0]
           elsif i < 9 && frame[0] == 10 && frames[i + 1]
             frame.sum + frames[i + 1][0..1].sum
           elsif i < 9 && frame.sum == 10 && frames[i + 1]
             frame.sum + frames[i + 1][0]
           else
             frame.sum
           end
end

puts point
