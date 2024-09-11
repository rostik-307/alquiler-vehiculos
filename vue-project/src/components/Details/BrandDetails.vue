<template>
    <div class="details">
        <h1>Detalles de la Marca</h1>
        <p><strong>Nombre:</strong> {{ brand.name }}</p>
        <p><strong>Año:</strong> {{ brand.year }}</p>
        <p><strong>Detalles:</strong> {{ brand.details }}</p>
        <button class="edit-button" @click="goBack">Volver</button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandDetails',
    props: ['id'],
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
                const response = await axios.get(`http://localhost:8080/api/brands/${this.id}`);
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