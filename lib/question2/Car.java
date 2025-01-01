package question2;

class Car extends Vehicle {
    public Car(String brand, String model, int year) {
        super(brand, model, year);
    }

    @Override
    public void startEngine() {
        System.out.println("Start the car engine");
    }
}
