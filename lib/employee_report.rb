class Employee
  def initialize(name, age)
    @name, @age = name, age
  end

  attr_reader :age

  def name
    @name.upcase
  end

  def <=>(other)
    other.name <=> name
  end
end

class EmployeeReport
  def self.from_hashes(employee_hashes)
    new(employee_hashes.map do |e|
      Employee.new(e[:name], e[:age])
    end)
  end

  def initialize(employees)
    @employees = employees
  end

  def over_18
    # as_capitalized(employees_by_name).select { |employee| employee[:age] >= 18 }
    employees_by_name.select { |employee| employee.age >= 18 }
  end

  # def as_capitalized(employees)
  #   employees.map do |e|
  #     e.merge(name: e[:name].upcase)
  #   end
  # end

  private

  def employees_by_name
    employees.sort
  end

  attr_reader :employees
end
