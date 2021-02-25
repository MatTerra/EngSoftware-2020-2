require 'test/unit'
require_relative '../src/rollcall_parser'

class TestRollcallParser < Test::Unit::TestCase
  def test_should_save_file_name

    filename = 'tests/very_simple_file.txt'
    parser = RollcallParser.new(filename)
    assert_equal(filename,
                 parser.file_name)
  end

  def test_should_read_file_content
    parser = RollcallParser.new('tests/very_simple_file.txt')
    assert_equal("a",
                 parser.file_content)
  end

  def test_should_remove_empty_lines
    parser=RollcallParser.new('tests/file_with_newlines.txt')
    assert_equal(["a", "b"],
                 parser.file_lines)
  end

  def test_should_remove_excess_spaces
    parser=RollcallParser.new('tests/file_with_newlines_and_spaces.txt')
    assert_equal(["a", "b c"],
                 parser.file_lines)
  end

  def test_should_parse_1
    parser=RollcallParser.new('tests/engsoft.txt')
    assert_equal("18/0114913\tADELSON JHONATA SILVA DE SOUSA\n",
                 parser.parse(n=1))
  end

  def test_should_parse_2
    parser=RollcallParser.new('tests/engsoft.txt')
    assert_equal("18/0114913\tADELSON JHONATA SILVA DE SOUSA\n17/0056082\tANA PAULA MARTINS TARCHETTI\n",
                 parser.parse(n=2))
  end

  def test_should_access_student_after_parse
    parser=RollcallParser.new('tests/engsoft.txt')
    parser.parse()
    assert_equal("15/0005628\tANDREIA DE FREITAS NOVAIS\n".encode!('iso-8859-1'),
                 parser.students[2].to_s)
  end

  def test_each_should_return_student
    students = ["18/0114913\tADELSON JHONATA SILVA DE SOUSA\n".encode!('iso-8859-1'),
                "17/0056082\tANA PAULA MARTINS TARCHETTI\n".encode!('iso-8859-1')]
    parser=RollcallParser.new('tests/engsoft.txt')
    parser.parse(n=2)
    count = 0
    parser.each do |student|
      assert_equal(students[count], student.to_s)
      count += 1
    end
  end

  def test_sort_should_order_by_mat
    students = ["17/0056082\tANA PAULA MARTINS TARCHETTI\n".encode!('iso-8859-1'),
                "18/0114913\tADELSON JHONATA SILVA DE SOUSA\n".encode!('iso-8859-1')]
    parser=RollcallParser.new('tests/engsoft.txt')
    parser.parse(n=2)
    sorted = parser.sort
    count = 0
    sorted.each do |student|
      assert_equal(students[count], student.to_s)
      count += 1
    end
  end

  def test_sort_should_order_by_mat_on_parse
    students = ["17/0056082\tANA PAULA MARTINS TARCHETTI\n".encode!('iso-8859-1'),
                "18/0114913\tADELSON JHONATA SILVA DE SOUSA\n".encode!('iso-8859-1')].join('')
    parser=RollcallParser.new('tests/engsoft.txt')
    rollcall = parser.parse(n=2, order_by=1)
    assert_equal(students, rollcall)
  end

  def test_sort_by_name_should_work
    students = ["18/0114913\tADELSON JHONATA SILVA DE SOUSA\n".encode!('iso-8859-1'),
                "17/0056082\tANA PAULA MARTINS TARCHETTI\n".encode!('iso-8859-1')]
    parser=RollcallParser.new('tests/engsoft.txt')
    parser.parse(n=2)
    sorted = parser.sort_by{|student| student.nome}
    count = 0
    sorted.each do |student|
      assert_equal(students[count], student.to_s)
      count += 1
    end
  end

  def test_sort_should_order_by_name_on_parse
    students = ["18/0114913\tADELSON JHONATA SILVA DE SOUSA\n".encode!('iso-8859-1'),
                "17/0056082\tANA PAULA MARTINS TARCHETTI\n".encode!('iso-8859-1')].join('')
    parser=RollcallParser.new('tests/engsoft.txt')
    rollcall = parser.parse(n=2, order_by=2)
    assert_equal(students, rollcall)
  end

  def test_each_unparsed_should_be_nil
    parser=RollcallParser.new('tests/engsoft.txt')
    assert_equal(nil, parser.each)
  end
end