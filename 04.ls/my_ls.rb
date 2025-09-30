# frozen_string_literal: true

# class MyLs
DEFAULT_LINES = 3
CHARCTOR_WIDTH = 20

def format_filenames(width)
  files = Dir.glob('*').sort
  new_files = []
  files.map do |file|
    output_width = file.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.reduce(0, &:+)
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
# end

# my_ls = MyLs.new
main
