require 'byebug'

class Employee

    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def self.all
        ObjectSpace.each_object(self).to_a
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    def inspect
        "#{self.name}"
    end


end

class Manager < Employee

    attr_accessor :assigned_employees

    def initialize(name, title, salary, boss)
        super
        @assigned_employees = []
        get_assigned_employees
    end

    def get_assigned_employees
        employees = Employee.all
        employees.each do |employee|
            @assigned_employees << employee if employee.boss == @name
        end
        @employees
    end


    def bonus(multiplier)
        suboordinates = @assigned_employees
        total_sum = 0
        suboordinates.each do |suboordinate|
            if suboordinate.instance_of? Manager
                result = suboordinate.bonus(multiplier)
                total_sum += result
            end
            total_sum += suboordinate.salary * multiplier
        end
        total_sum
    end
end

shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
ned = Manager.new("Ned", "Founder", 1000000, nil)
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
