class RollcallParser
  attr_reader :file_name
  attr_reader :file_content
  attr_reader :file_lines
  attr_reader :students
  @@student_line_regex = /^([0-9]{2}\/[0-9]{7}) ([A-Z][A-Z ]*)$/
  include Enumerable

  # @param [string] file_name
  def initialize(file_name)
    @file_name = file_name
    read_file_content
    get_file_lines
    exclude_blank_lines
    remove_extra_whitespace
    @students = "Not parsed yet! Call parse to access students!"
  end

  def parse(n=0, order_by=0)
    @students = get_students

    @students = @students[0..n-1]

    format_lines(@students, order_by).join('')
  end

  def each
    if @students == "Not parsed yet! Call parse to access students!"
      return nil
    end
    @students.each do |student|
      yield student
    end
  end

  private

  def read_file_content
    file = File.open(@file_name, :encoding => 'iso-8859-1')
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
      line.gsub(/\s+/, ' ').gsub(/^\s+/, '').gsub(/\s+$/, '')
    end
  end

  def get_students
    students = []
    @file_lines.select! do |line|
      line.match?(@@student_line_regex)
    end
    @file_lines.each do |line|
      students << Student.new(line.scan(/^([0-9]{2}\/[0-9]{7})/)[0][0],
                               line.scan(/([A-Z][A-Z ]*)$/)[0][0])
    end
    students
  end

  def format_lines(students, order_by=0)
    if order_by == 1
      students = students.sort
    end
    if order_by == 2
      students = students.sort_by{|student| student.nome}
    end
    lines = students.map do |student|
      student.to_s
    end
    lines
  end
end

class Student
  attr_accessor :matricula
  attr_accessor :nome

  def initialize(matricula, nome)
    @matricula = matricula
    @nome = nome
  end

  def to_s
    @matricula+"\t"+@nome+"\n"
  end

  def <=>(other)
    return @matricula <=> other.matricula
  end
end