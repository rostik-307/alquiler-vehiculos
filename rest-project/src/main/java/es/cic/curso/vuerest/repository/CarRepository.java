package es.cic.curso.vuerest.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import es.cic.curso.vuerest.model.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {
    // Additional query methods (if necessary) can be defined here
}
