require 'FileUtils'

class FileMover

  class << self
    def initiate_file_move
      puts "Welcome to the file moving program."

      origin_directory = get_origin_directory
      destination_directory = get_destination_directory(origin_directory)

      puts "Thanks! If you're moving multiple files, please enter a pattern your file names follow. ."
      file_pattern = gets.chomp
      regex = /#{file_pattern}/i
      files = Dir.entries(origin_directory)

      move_all_files(files, origin_directory, destination_directory, regex)

      puts "Finished!"
    end

    def move_all_files(files, origin_directory, destination_directory, regex)
      files.each do |file|
        if regex === file
          origin_file = File.join(origin_directory, file)
          destination_file = File.join(destination_directory, file)

          FileUtils.mv(origin_file, destination_file)

          puts "We moved #{file} from #{origin_directory} to #{destination_directory}."
        end
      end

    end

    def get_origin_directory
      puts "Do you want to use your current location as the origin directory? Please type y/n."

      boolean = gets.chomp

      if  boolean == 'y'
        origin_directory = Dir.pwd
      elsif boolean == 'n'
        puts "Please type in the full path to your origin directory."
        origin_directory = gets.chomp
      else
        get_origin_directory
      end

      puts "Your origin directory is #{origin_directory}."
      return origin_directory
    end

    def get_destination_directory(origin_directory=nil)
      puts "Do you want to use your origin directory as the base path?"

      boolean = gets.chomp

      if boolean == 'y'
        puts "Please type in the relative path to your destination directory."
        directory_name = gets.chomp
        destination_directory = File.join(origin_directory, directory_name)
      elsif boolean == 'n'
        puts "Please type in the full path to your destination directory"
        destination_directory = gets.chomp
      else
        get_destination_directory
      end

      puts "Your destination directory is #{destination_directory}."
      return destination_directory
    end
  end
end

FileMover.initiate_file_move
