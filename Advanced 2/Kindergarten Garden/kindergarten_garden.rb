class Garden
  SEEDS = { 'R' => :radishes, 'C' => :clover,
            'G' => :grass, 'V' => :violets }
  DEF_CHILDREN = ['alice', 'bob', 'charlie', 'david', 'eve', 'fred', 'ginny',
              'harriet', 'ileana', 'joseph', 'kincaid', 'larry']

  def initialize(diagram, students = DEF_CHILDREN)
    @diagram = diagram.split("\n")
    @students = students.sort.map { |student| student.downcase }
    create_instance_methods
  end

  def create_instance_methods
    @students.each do |child_name|
      self.class.send(:define_method, child_name) do
        t = @students.index(child_name)
        @diagram.each_with_object([]) { |row, res| res << row[t*2..t*2 + 1] }
          .join("").chars.map { |char| SEEDS.fetch(char) }
      end
    end
  end
end
