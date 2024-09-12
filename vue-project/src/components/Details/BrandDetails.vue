<template>
    <div class="details">
        <h1>Detalles de la Marca</h1>
        <p><strong>Nombre:</strong> {{ brand.name }}</p>
        <p><strong>Año:</strong> {{ brand.year }}</p>
        <p><strong>Detalles:</strong> {{ brand.details }}</p>
        <button class="edit-button" @click="goBack">
            <img src="/src/assets/back.svg" alt="atras" class="crud-button"/>
        </button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandDetails',
    data() {
        return {
            brand: {}
        };
    },
    created() {
        this.fetchBrand();
    },
    methods: {
        async fetchBrand() {
            try {
                // Get the id from the route parameter
                const brandId = this.$route.params.id;
                const response = await axios.get(`http://localhost:8080/api/brands/${brandId}`);
                this.brand = response.data;
            } catch (error) {
                console.error('Error fetching brand details:', error);
            }
        },
        goBack() {
            this.$router.push('/brands');
        }
    }
};
</script>
