package question2;

class Bike extends Vehicle {
    public Bike(String brand, String model, int year) {
        super(brand, model, year);
    }

    @Override
    public void startEngine() {
        System.out.println("Start the Bike engine");
    }
}
