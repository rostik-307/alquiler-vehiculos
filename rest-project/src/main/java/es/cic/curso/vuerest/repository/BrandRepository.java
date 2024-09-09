package es.cic.curso.vuerest.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import es.cic.curso.vuerest.model.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Long> {
    // Additional query methods (if necessary) can be defined here
}
