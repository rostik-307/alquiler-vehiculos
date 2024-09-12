package es.cic.curso.vuerest;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import es.cic.curso.vuerest.model.Brand;

public class BrandTests {

    @Test
    public void testDefaultConstructor() {
        Brand brand = new Brand();
        assertNotNull(brand);
        assertNull(brand.getId());
        assertNull(brand.getName());
    }

    @Test
    public void testParameterizedConstructor() {
        Brand brand = new Brand("Toyota", 1937, "Japanese car manufacturer");
        assertNotNull(brand);
        assertEquals("Toyota", brand.getName());
        assertEquals(1937, brand.getYear());
        assertEquals("Japanese car manufacturer", brand.getDetails());
        assertFalse(brand.getDisabled());
    }

    @Test
    public void testGettersAndSetters() {
        Brand brand = new Brand();
        brand.setId(1L);
        brand.setName("Toyota");
        brand.setYear(1937);
        brand.setDetails("Japanese car manufacturer");
        brand.setDisabled(true);

        assertEquals(1L, brand.getId());
        assertEquals("Toyota", brand.getName());
        assertEquals(1937, brand.getYear());
        assertEquals("Japanese car manufacturer", brand.getDetails());
        assertTrue(brand.getDisabled());
    }
}