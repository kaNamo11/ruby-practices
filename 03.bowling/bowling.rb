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

frames = shots.each_slice(2).to_a

point = frames[0..9].each_with_index.sum do |frame, i|
  next_frame = frames[i + 1]
  after_next_frame = frames[i + 2]
  if i == 9
    [frame, next_frame, after_next_frame].compact.flatten.sum
  elsif frame[0] == 10
    if next_frame[0] == 10
      frame.sum + next_frame[0] + after_next_frame[0]
    else
      frame.sum + next_frame[0..1].sum
    end
  elsif frame.sum == 10
    frame.sum + next_frame[0]
  else
    frame.sum
  end
end

puts point
