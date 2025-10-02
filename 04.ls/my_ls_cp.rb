# frozen_string_literal: true

DEFAULT_LINES = 3
CHARCTOR_WIDTH = 20
FILES = Dir.glob('*')

def format_filenames(width)
  new_files = []
  FILES.map do |file|
    output_width = file.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.sum
    padding_size = [0, width - output_width].max
    new_files << file + ' ' * padding_size
  end
  new_files
end

def fetch_file_names(number_of_lines)
  files = format_filenames(CHARCTOR_WIDTH)
  column = (files.count.to_f / number_of_lines).ceil
  files.count

  files.fill(nil, files.length...(number_of_lines * column))

  [files, column]
end

def main
  files, column = fetch_file_names(DEFAULT_LINES)

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
