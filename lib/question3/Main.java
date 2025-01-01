public class Main {

    public static void main(String[] args) {
               FullTimeEmployee fullTimeEmployee = new FullTimeEmployee("Shrouk", 1, 5000.00);
               PartTimeEmployee partTimeEmployee = new PartTimeEmployee("ibrahim", 2, 24.00, 30);
               System.out.println("Full-Time Employee Salary: " + fullTimeEmployee.calculateSalary());
               fullTimeEmployee.generateReport();
               System.out.println("Part-Time Employee Salary: " + partTimeEmployee.calculateSalary());
               partTimeEmployee.generateReport();
    }}