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

point = frames [0..9].each_with_index.sum do |frame, i|
  next_frame = frames[i + 1]
  next_2_frame = frames[i + 2]
  point = if i == 9
            if next_2_frame
              frame.sum + next_frame[0] + next_2_frame[0]
            elsif next_frame
              frame.sum + next_frame.sum
            else
              frame.sum
            end
          elsif i < 9
            if frame[0] == 10
              if next_frame[0] == 10 && next_2_frame[0]
                frame.sum + next_frame[0] + next_2_frame[0]
              elsif next_frame
                frame.sum + next_frame[0..1].sum
              else
                frame.sum
              end
            elsif next_frame && frame.sum == 10
              frame.sum + next_frame[0]
            else
              frame.sum
            end
          else
            frame.sum
          end
end

puts point
