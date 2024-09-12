package es.cic.curso.vuerest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import es.cic.curso.vuerest.model.Brand;
import es.cic.curso.vuerest.service.BrandService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/brands")
@CrossOrigin(origins = "http://localhost:5173") // Specify the allowed origin
public class BrandController {

    @Autowired
    private BrandService brandService;

    @GetMapping
    public List<Brand> getAllBrands() {
        return brandService.getAllBrands();
    }

    @GetMapping("/{id}")
    public Optional<Brand> getBrandById(@PathVariable Long id) {
        return brandService.getBrandById(id);
    }

    @PostMapping
    public Brand createBrand(@RequestBody Brand brand) {
        return brandService.saveBrand(brand);
    }

    @PutMapping("/{id}")
    public Brand updateBrand(@PathVariable Long id, @RequestBody Brand brand) {
        brand.setId(id); // ensure the correct brand is updated
        return brandService.saveBrand(brand);
    }

    @DeleteMapping("/{id}")
    public void deleteBrand(@PathVariable Long id) {
        brandService.deleteBrand(id);
    }

    @PutMapping("/{id}/disable")
    public Brand disableBrand(@PathVariable Long id, @RequestBody Brand brand) {
        brand.setDisabled(true);
        return brandService.saveBrand(brand);
    }

    @PutMapping("/{id}/enable")
    public Brand enableBrand(@PathVariable Long id, @RequestBody Brand brand) {
        brand.setDisabled(false);
        return brandService.saveBrand(brand);
    }
}
