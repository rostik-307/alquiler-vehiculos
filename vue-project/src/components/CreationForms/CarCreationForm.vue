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
            <select v-model="car.brand_id" id="brand_id" required>
                <option v-for="brand in brands" :key="brand.id" :value="brand.id">
                    {{ brand.name }}
                </option>
            </select>

            <button type="submit">Guardar</button>
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
                brand_id: ''
            },
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
        async createCar() {
            try {
                await axios.post('http://localhost:8080/api/cars', this.car);
                this.$router.push('/cars');
            } catch (error) {
                console.error('Error creating car:', error);
            }
        }
    }
};
</script>
