require 'rspec'
require './file_mover.rb'

describe FileMover do
  describe "#move_all_files" do
  end

  describe "#move_file" do
    let!(:dir_a) { "./test_environment/dir_a/" } 
    let!(:dir_b) { "./test_environment/dir_b/" } 
    let!(:base_name) { "file_a.txt" }
    let(:start_file) { dir_a << base_name }
    let(:destination_file) { dir_b << base_name }

    it "should move file_a from dir_a to dir_b" do
      File.exist?(start_file).should be(true)

      FileMover.move_file(start_file, destination_file)

      File.exist?(destination_file).should be(true);
      File.exist?(start_file).should be(false);
    end

    after(:each) do
      FileMover.move_file(destination_file, start_file)

      File.exist?(start_file).should be(true);
      File.exist?(destination_file).should be(false);
    end
  end
end
