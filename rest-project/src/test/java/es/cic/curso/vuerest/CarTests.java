package es.cic.curso.vuerest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import es.cic.curso.vuerest.model.Brand;
import es.cic.curso.vuerest.model.Car;

public class CarTests {

    @Test
    public void testDefaultConstructor() {
        Car car = new Car();
        assertNotNull(car);
        assertNull(car.getId());
        assertNull(car.getModel());
        assertNull(car.getYear());
        assertNull(car.getColor());
        assertNull(car.getDescription());
        assertNull(car.getObservations());
        assertFalse(car.isAvailable());
        assertNull(car.getBrand());
    }

    @Test
    public void testParameterizedConstructor() {
        Brand brand = new Brand();
        Car car = new Car("Corolla", 2020, "Blue", "A reliable car", "No observations", true, brand);
        assertNotNull(car);
        assertEquals("Corolla", car.getModel());
        assertEquals(2020, car.getYear());
        assertEquals("Blue", car.getColor());
        assertEquals("A reliable car", car.getDescription());
        assertEquals("No observations", car.getObservations());
        assertTrue(car.isAvailable());
        assertEquals(brand, car.getBrand());
    }

    @Test
    public void testGettersAndSetters() {
        Brand brand = new Brand();
        Car car = new Car();
        car.setId(1L);
        car.setModel("Corolla");
        car.setYear(2020);
        car.setColor("Blue");
        car.setDescription("A reliable car");
        car.setObservations("No observations");
        car.setAvailable(true);
        car.setBrand(brand);

        assertEquals(1L, car.getId());
        assertEquals("Corolla", car.getModel());
        assertEquals(2020, car.getYear());
        assertEquals("Blue", car.getColor());
        assertEquals("A reliable car", car.getDescription());
        assertEquals("No observations", car.getObservations());
        assertTrue(car.isAvailable());
        assertEquals(brand, car.getBrand());
    }
}