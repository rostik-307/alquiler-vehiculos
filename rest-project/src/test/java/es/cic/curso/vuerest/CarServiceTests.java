package es.cic.curso.vuerest;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.junit.jupiter.api.extension.ExtendWith;

import es.cic.curso.vuerest.model.Car;
import es.cic.curso.vuerest.repository.CarRepository;
import es.cic.curso.vuerest.service.CarService;

@ExtendWith(MockitoExtension.class)  // Use MockitoExtension instead of @SpringBootTest
public class CarServiceTests {

    @Mock
    private CarRepository carRepository;

    @InjectMocks
    private CarService carService;

    @BeforeEach
    public void setUp() {
        // MockitoAnnotations.openMocks(this); // No need for this when using @ExtendWith(MockitoExtension.class)
    }

    @Test
    public void testGetAllCars() {
        Car car1 = new Car();
        Car car2 = new Car();
        List<Car> cars = Arrays.asList(car1, car2);

        when(carRepository.findAll()).thenReturn(cars);

        List<Car> result = carService.getAllCars();
        assertEquals(2, result.size());
        verify(carRepository, times(1)).findAll();
    }

    @Test
    public void testGetCarById() {
        Car car = new Car();
        car.setId(1L);

        when(carRepository.findById(1L)).thenReturn(Optional.of(car));

        Optional<Car> result = carService.getCarById(1L);
        assertTrue(result.isPresent());
        assertEquals(1L, result.get().getId());
        verify(carRepository, times(1)).findById(1L);
    }

    @Test
    public void testSaveCar() {
        Car car = new Car();

        when(carRepository.save(car)).thenReturn(car);

        Car result = carService.saveCar(car);
        assertNotNull(result);
        verify(carRepository, times(1)).save(car);
    }

    @Test
    public void testDeleteCar() {
        Long carId = 1L;

        doNothing().when(carRepository).deleteById(carId);

        carService.deleteCar(carId);
        verify(carRepository, times(1)).deleteById(carId);
    }
}
