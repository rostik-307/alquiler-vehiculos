<template>
    <div>
        <h1>Marcas
            <button class="crear-button" @click="goToBrandCreationForm">Crear Marca</button>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Año</th>
                    <th>Detalles</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="brand in brands" :key="brand.id">
                    <td>{{ brand.name }}</td>
                    <td>{{ brand.year }}</td>
                    <td>{{ brand.details }}</td>
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
            brands: []
        };
    },
    created() {
        this.fetchBrands();
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
            this.$router.push('/brand/create');
        }
    }
};
</script>
