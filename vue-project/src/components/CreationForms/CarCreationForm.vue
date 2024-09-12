<template>
    <div class="creation-form">
        <h1>Crear Coche</h1>
        <form @submit.prevent="createCar">
            <label for="model">Modelo:</label>
            <input type="text" v-model="car.model" id="model" required />

            <label for="year">Año:</label>
            <input type="number" v-model="car.year" id="year" min="1800" max="3000" required />

            <label for="color">Color:</label>
            <input type="text" v-model="car.color" id="color" />

            <label for="description">Descripción:</label>
            <input type="text" v-model="car.description" id="description" />

            <label for="brand_id">Marca:</label>
            <select v-model="selectedBrand" id="brand_id" required>
                <option v-for="brand in brands" :key="brand.id" :value="brand">
                    {{ brand.name }}
                </option>
            </select>

            <button class="back-button" @click="goBack">
                <img src="/src/assets/back.svg" alt="crear" class="crud-button"/>
            </button>
            <button class="submit-button" type="submit">
                <img src="/src/assets/save.svg" alt="guardar" class="crud-button"/>
            </button>   
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'CarCreationForm',
    data() {
        return {
            car: {
                model: '',
                year: '',
                color: '',
                description: '',
                brand: null  // Change brand_id to brand
            },
            brands: [], // Array to hold the list of brands
            selectedBrand: null, // To hold the selected brand object
            errorMessage: null // For displaying error messages
        };
    },
    created() {
        this.fetchBrands(); // Fetch the list of brands when the component is created
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
        async createCar() {
            try {
                const carData = {
                    ...this.car,
                    brand: this.selectedBrand, // Use the selected brand object
                    available: true // Set available to true
                };

                // Use POST to create a new car
                await axios.post('http://localhost:8080/api/cars', carData);
                // Handle successful creation
                this.$router.push('/cars');
            } catch (error) {
                console.error('Error creating car:', error);
                this.errorMessage = `Error creating car: ${error.response?.data?.message || error.message}`;
            }
        },
        goBack() {
            this.$router.push('/cars');
        }
    }
};
</script>
