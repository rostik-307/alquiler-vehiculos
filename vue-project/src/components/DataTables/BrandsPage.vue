<template>
    <div>
        <h1>Marcas
            <button class="crear-button" @click="goToBrandCreationForm">Crear Marca</button>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>
                        Nombre
                        <button class="sort-button" @click="sort('name')">↕</button>
                    </th>
                    <th>
                        Año
                        <button class="sort-button" @click="sort('year')">↕</button>
                    </th>
                    <th>
                        Detalles
                        <button class="sort-button" @click="sort('details')">↕</button>
                    </th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="brand in sortedBrands" :key="brand.id">
                    <td>{{ brand.name }}</td>
                    <td>{{ brand.year }}</td>
                    <td class="table-details">{{ brand.details }}</td>
                    <td>
                        <button class="details-button" @click="viewBrandDetails(brand.id)">Detalles</button>
                        <button class="edit-button" @click="editBrand(brand.id)">Editar</button>
                        <button class="delete-button" @click="confirmDelete(brand.id)">Eliminar</button>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <h2>Marcas Deshabilitadas</h2>
        <table v-if="disabledBrands.length > 0">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Año</th>
                    <th>Detalles</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="brand in disabledBrands" :key="brand.id">
                    <td>{{ brand.name }}</td>
                    <td>{{ brand.year }}</td>
                    <td class="table-details">{{ brand.details }}</td>
                    <td>
                        <button class="details-button" @click="viewBrandDetails(brand.id)">Detalles</button>
                        <button class="edit-button" @click="editBrand(brand.id)">Editar</button>
                        <button class="enable-button" @click="enableBrand(brand.id)">Habilitar</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandsPage',
    data() {
        return {
            brands: [],
            sortKey: '',
            sortOrder: 'asc', // 'asc' for ascending, 'desc' for descending
        };
    },
    created() {
        this.fetchBrands();
    },
    computed: {
        sortedBrands() {
            return this.brands
                .filter(brand => !brand.disabled) // Filter out disabled brands
                .sort((a, b) => {
                    if (this.sortKey) {
                        const aValue = a[this.sortKey];
                        const bValue = b[this.sortKey];
                        if (aValue < bValue) return this.sortOrder === 'asc' ? -1 : 1;
                        if (aValue > bValue) return this.sortOrder === 'asc' ? 1 : -1;
                        return 0;
                    }
                    return 0;
                });
        },
        disabledBrands() {
            return this.brands.filter(brand => brand.disabled);
        }
    },
    methods: {
        async fetchBrands() {
            try {
                const response = await axios.get('http://localhost:8080/api/brands');
                this.brands = response.data;
            } catch (error) {
                console.error('Error fetching brands:', error);
            }
        },
        goToBrandCreationForm() {
            this.$router.push('/brands/create');
        },
        viewBrandDetails(brandId) {
            this.$router.push(`/brands/${brandId}`);
        },
        editBrand(brandId) {
            this.$router.push(`/brands/edit/${brandId}`);
        },
        async confirmDelete(brandId) {
            // Show confirmation dialog
            if (confirm('Are you sure you want to delete this brand?')) {
                await this.deleteBrand(brandId);
            }
        },
        async deleteBrand(brandId) {
            try {
                await axios.patch(`http://localhost:8080/api/brands/${brandId}/disable`);
                this.brands = this.brands.filter(brand => brand.id !== brandId);
            } catch (error) {
                console.error('Error disabling brand:', error);
            }
        },
        async enableBrand(brandId) {
            try {
                await axios.patch(`http://localhost:8080/api/brands/${brandId}/enable`);
                this.fetchBrands(); // Refresh the brand list
            } catch (error) {
                console.error('Error enabling brand:', error);
            }
        },
        sort(key) {
            if (this.sortKey === key) {
                this.sortOrder = this.sortOrder === 'asc' ? 'desc' : 'asc';
            } else {
                this.sortKey = key;
                this.sortOrder = 'asc';
            }
        }
    }
};
</script>

<style scoped>
/* Add some basic styling for the sort buttons */
button {
    margin-left: 5px;
}
</style>
