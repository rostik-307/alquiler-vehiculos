package es.cic.curso.vuerest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import es.cic.curso.vuerest.model.Car;
import es.cic.curso.vuerest.service.CarService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/cars")
@CrossOrigin(origins = "http://localhost:5173")  // Specify the allowed origin
public class CarController {

    @Autowired
    private CarService carService;

    @GetMapping
    public List<Car> getAllCars() {
        return carService.getAllCars();
    }

    @GetMapping("/{id}")
    public Optional<Car> getCarById(@PathVariable Long id) {
        return carService.getCarById(id);
    }

    @PostMapping
    public Car createCar(@RequestBody Car car) {
        // Ensure that the car object does not include an id
        return carService.saveCar(car);
    }
    
    @PutMapping("/{id}")
    public Car updateCar(@PathVariable Long id, @RequestBody Car car) {
        car.setId(id); // Ensure the correct car is updated
        return carService.saveCar(car);
    }

    @DeleteMapping("/{id}")
    public void deleteCar(@PathVariable Long id) {
        carService.deleteCar(id);
    }
}
