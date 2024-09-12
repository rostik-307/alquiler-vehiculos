<template>
    <div class="creation-form">
        <h1>Editar Marca</h1>
        <form @submit.prevent="updateBrand">
            <label for="name">Nombre:</label>
            <input type="text" v-model="brand.name" id="name" required />

            <label for="year">Año:</label>
            <input type="number" v-model="brand.year" id="year" required />

            <label for="details">Detalles:</label>
            <input type="text" v-model="brand.details" id="details" />

            <button class="back-button" @click="goBack">
                <img src="/src/assets/back.svg" alt="atras" class="crud-button"/>
            </button>
            <button class="submit-button" type="submit">
                <img src="/src/assets/save.svg" alt="guadar" class="crud-button"/>
            </button>        
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandEditForm',
    data() {
        return {
            brand: {
                name: '',
                year: '',
                details: ''
            }
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
                console.error('Error fetching brand:', error);
            }
        },
        async updateBrand() {
            try {
                // Get the id from the route parameter
                const brandId = this.$route.params.id;
                await axios.put(`http://localhost:8080/api/brands/${brandId}`, this.brand);
                this.$router.push('/brands');
            } catch (error) {
                console.error('Error updating brand:', error);
            }
        },
        goBack() {
            this.$router.push('/brands');
        }
    }
};
</script>
