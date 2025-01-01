package question3;

class PartTimeEmployee extends Employee {
    private double hourSalary;
    private int hoursWorked;

    // Constructor
    public PartTimeEmployee(String name, int id, double hourSalary, int hoursWorked) {
        super(name, id);
        this.hourSalary = hourSalary;
        this.hoursWorked = hoursWorked;
    }


    @Override
    public double calculateSalary() {
        return hourSalary * hoursWorked;
    }


    @Override
    public void generateReport() {
        System.out.println("Part-Time Employee Report");
        System.out.println("Name: " + name);
        System.out.println("ID: " + id);
        System.out.println("Hourly Wage: " + hourSalary);
        System.out.println("Hours Worked: " + hoursWorked);
        System.out.println("Salary: " + calculateSalary());
    }


}
