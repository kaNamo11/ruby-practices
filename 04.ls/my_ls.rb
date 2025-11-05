# frozen_string_literal: true

require 'optparse'

DEFAULT_LINES = 3

def main
  opt = OptionParser.new
  params = {}
  opt.on('-a') { |v| params[:a] = v }
  opt.parse!(ARGV)

  filenames_matrix = if params[:a]
                       pad_filenames(Dir.glob(['*', '.*'], File::FNM_DOTMATCH)).uniq
                     else
                       pad_filenames(Dir.glob('*'))
                     end

  formatted_file_names = convert_filenames_to_matrix(filenames_matrix, DEFAULT_LINES)
  print_file_names(formatted_file_names[0], formatted_file_names[1])
end

def pad_filenames(files)
  exit if files.empty?
  file_names_with_length = files.map do |file|
    {
      name: file,
      length: file.each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.sum
    }
  end

  max_file_name_length = file_names_with_length.max_by { |h| h[:length] }[:length]

  file_names_with_length.map do |hash|
    name = hash[:name]
    output_width = hash[:length]
    padding_size = [0, max_file_name_length - output_width].max
    "#{name}#{' ' * padding_size}"
  end
end

def convert_filenames_to_matrix(files, number_of_lines)
  column = (files.count.to_f / number_of_lines).ceil

  files.fill(nil, files.length...(number_of_lines * column))

  [files, column]
end

def print_file_names(files, column)
  rows = files.each_slice(column).to_a
  result = rows.transpose

  result.each do |row|
    puts row.join(' ')
  end
end

main
