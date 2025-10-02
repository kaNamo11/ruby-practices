# frozen_string_literal: true

DEFAULT_LINES = 3
CHARCTOR_WIDTH = 20
def main
  file_names = format_filenames(CHARCTOR_WIDTH,Dir.glob('*'))
  formatted_file_names = format(file_names,DEFAULT_LINES)
  print_file_names(formatted_file_names[0],formatted_file_names[1])
end

#ファイルの名前の文字数を揃える
def format_filenames(width,files)
  new_files = []
  files.each do |file|
    output_width = file.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.sum
    padding_size = [0, width - output_width].max
    new_files << file + ' ' * padding_size
  end
  new_files
end

#ファイルを並び替える
def format(files,number_of_lines)
  column = (files.count.to_f / number_of_lines).ceil
  files.count

  files.fill(nil, files.length...(number_of_lines * column))

  [files, column]
end

#ファイルを表示する
def print_file_names(files,column)
  if files.empty?
    puts ''
  else
    rows = files.each_slice(column).to_a
    result = rows.transpose

    result.each do |row|
      puts row.join(' ')
    end
  end
end

main
