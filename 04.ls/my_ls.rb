def make_file_array(number_of_lines)
  files = Dir.glob('*').sort

  col = (files.count.to_f / number_of_lines).ceil
  add_files = number_of_lines * col - files.count

  add_files.times do |_i|
    files << nil
  end
  [files, col]
end

def display_list
  files, col = make_file_array(3)
  rows = files.each_slice(col).to_a # => 3 行（各行 col 要素）
  result = rows.transpose # => col 行 × 3 列（縦並び）

  result.each do |row|
    puts row.compact.join(' ')
  end
end

display_list
