package es.cic.curso.vuerest.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import es.cic.curso.vuerest.model.Car;


@Repository
public interface CarRepository extends JpaRepository<Car, Long> {
}
