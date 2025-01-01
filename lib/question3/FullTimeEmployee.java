package question3;

class FullTimeEmployee extends Employee {
    private double monthlySalary;

    // Constructor
    public FullTimeEmployee(String name, int id, double monthlySalary) {
        super(name, id);
        this.monthlySalary = monthlySalary;
    }


    @Override
    public double calculateSalary() {
        return monthlySalary;
    }


    @Override
    public void generateReport() {
        System.out.println("Full-Time Employee Report");
        System.out.println("Name: " + name);
        System.out.println("ID: " + id);
        System.out.println("Monthly Salary: " + monthlySalary);
    }


}
