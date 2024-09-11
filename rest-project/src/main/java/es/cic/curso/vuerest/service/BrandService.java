package es.cic.curso.vuerest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.cic.curso.vuerest.model.Brand;
import es.cic.curso.vuerest.repository.BrandRepository;

import java.util.List;
import java.util.Optional;

@Service
public class BrandService {

    @Autowired
    private BrandRepository brandRepository;

    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }

    public Optional<Brand> getBrandById(Long id) {
        return brandRepository.findById(id);
    }

    public Brand saveBrand(Brand brand) {
        return brandRepository.save(brand);
    }

    public void deleteBrand(Long id) {
        brandRepository.deleteById(id);
    }

    public void disableBrand(Long id) {
        Brand brand = brandRepository.findById(id).get();
        brand.setDisabled(true);
        brandRepository.save(brand);
    }

    public void enableBrand(Long id) {
        Brand brand = brandRepository.findById(id).get();
        brand.setDisabled(false);
        brandRepository.save(brand);
    }
}
