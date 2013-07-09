require 'FileUtils'

class FileMover

  class << self
    def move_all_files
      puts "Welcome to the file moving program."
      puts "Please enter the directory of the files you want to move."
      start_directory = gets.chomp

      puts "Please enter the destination directory."
      destination_directory = gets.chomp

      puts "Thanks! If you're moving multiple files, please enter a pattern in the file name."

      file_pattern = gets.chomp
      regex = /#{file_pattern}/i
      files = Dir.entries(start_directory)

      files.each do |file|
        if regex === file
          start_file = File.join(start_directory, file)
          destination_file = File.join(destination_directory, file)

          move_file(start_file, destination_file)

          puts "We moved #{file} from #{start_directory} to #{destination_directory}."
        end
      end

      puts "Finished!"
    end

    def move_file(file, new_file)
      FileUtils.mv(file, new_file)
    end

  end
end

FileMover.move_all_files
