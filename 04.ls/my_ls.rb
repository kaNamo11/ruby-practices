# frozen_string_literal: true

DEFAULT_LINES = 3

def main
  file_names = format_filenames(Dir.glob('*'))
  formatted_file_names = format(file_names, DEFAULT_LINES)
  print_file_names(formatted_file_names[0], formatted_file_names[1])
end

def format_filenames(files)
  new_files = []
  file_name_max = files.max.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.sum

  files.each do |file|
    output_width = file.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.sum
    padding_size = [0, file_name_max - output_width].max
    new_files << "#{file}#{' ' * padding_size}"
  end
  new_files
end

def format(files, number_of_lines)
  column = (files.count.to_f / number_of_lines).ceil

  files.fill(nil, files.length...(number_of_lines * column))

  [files, column]
end

def print_file_names(files, column)
  if files.empty?
    exit
  else
    rows = files.each_slice(column).to_a
    result = rows.transpose

    result.each do |row|
      puts row.join(' ')
    end
  end
end

main
