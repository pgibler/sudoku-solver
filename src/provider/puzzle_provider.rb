class PuzzleProvider
  def initialize()

  end

  def read_lines
    fileObj = File.new($fileName, "r")
    while (line = fileObj.gets)
      puts(line)
    end
    fileObj.close
  end
end