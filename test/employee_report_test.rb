require "test_helper"
require "employee_report"

class EmployeeReportTest < ActiveSupport::TestCase
  test "list all employee who are over 18" do
    max = Employee.new("Max", 17)
    sepp = Employee.new("Sepp", 18)
    nina = Employee.new("Nina", 15)
    mike = Employee.new("Mike", 51)

    employees = [
      max, sepp, nina, mike
    ]
    employee_report = EmployeeReport.new(employees)

    result = employee_report.over_18

    assert_includes result, sepp
    assert_includes result, mike
  end

  test "employee list is ordered reverse alphabetically" do
    sepp = Employee.new("Sepp", 18)
    mike = Employee.new("Mike", 51)

    employees = [
      sepp, mike
    ]
    employee_report = EmployeeReport.new(employees)

    result = employee_report.over_18

    assert_equal [sepp, mike], result
  end

  test "employee list is capitalized" do
    sepp = Employee.new("Sepp", 18)
    employee_report = EmployeeReport.new([sepp])

    result = employee_report.over_18

    assert_equal "SEPP", result.sole.name
  end
end
