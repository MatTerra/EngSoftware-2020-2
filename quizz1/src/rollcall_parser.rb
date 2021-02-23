class RollcallParser
  attr_reader :file_name
  attr_reader :file_content
  attr_reader :file_lines
  attr_reader :students
  @@student_line_regex = /^([0-9]{2}\/[0-9]{7}) ([A-Z][A-Z ]*)$/

  # @param [string] file_name
  def initialize(file_name)
    @file_name = file_name
    read_file_content
    get_file_lines
    exclude_blank_lines
    remove_extra_whitespace
    @students = "Not parsed yet! Call parse to access students!"
  end

  def parse(n=0)
    @students = get_student_lines

    @students = @students[0..n-1]

    format_lines(@students).join('')
  end

  private

  def read_file_content
    file = File.open(@file_name)
    @file_content = file.read
    file.close
  end

  def get_file_lines
    @file_lines = @file_content.split(/\n/)
  end

  def exclude_blank_lines
    @file_lines = @file_lines.select do |line|
      line != ""
    end
  end

  def remove_extra_whitespace
    @file_lines.map! do |line|
      line.gsub(/\s+/, ' ').gsub(/^\s+/, '')
    end
  end

  def get_student_lines
    @file_lines.select do |line|
      line.match?(@@student_line_regex)
    end
  end

  def format_lines(students)
    students.map! do |line|
      line.gsub(@@student_line_regex, "\\1\t\\2\n")
    end
  end
end