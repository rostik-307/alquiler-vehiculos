<template>
    <div class="creation-form" v-if="car && brands.length > 0">
        <h1>Editar Coche</h1>
        <form @submit.prevent="updateCar">
            <label for="model">Modelo:</label>
            <input type="text" v-model="car.model" id="model" required />

            <label for="year">Año:</label>
            <input type="number" v-model="car.year" id="year" required />

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

            <button class="back-button" @click="goBack">Atrás</button>
            <button class="submit-button" type="submit">Guardar</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'CarEditForm',
    props: ['id'],
    data() {
        return {
            car: {
                model: '',
                year: '',
                color: '',
                description: '',
                brand_id: '' // To hold the selected brand ID
            },
            brands: []
        };
    },
    created() {
        this.fetchCar();
        this.fetchBrands();
    },
    methods: {
        async fetchCar() {
            try {
                const response = await axios.get(`http://localhost:8080/api/cars/${this.id}`);
                this.car = response.data;
                // Assign brand_id from the nested brand object
                if (this.car.brand && this.car.brand.id) {
                    this.car.brand_id = this.car.brand.id;
                }
            } catch (error) {
                console.error('Error fetching car:', error);
            }
        },
        async fetchBrands() {
            try {
                const response = await axios.get('http://localhost:8080/api/brands');
                this.brands = response.data;
            } catch (error) {
                console.error('Error fetching brands:', error);
            }
        },
        async updateCar() {
            try {
                const updatedCar = {
                    ...this.car,
                    brand: {
                        id: this.car.brand_id
                    }
                };
                await axios.put(`http://localhost:8080/api/cars/${this.id}`, updatedCar);
                this.$router.push('/cars');
            } catch (error) {
                console.error('Error updating car:', error);
            }
        },
        goBack() {
            this.$router.push('/cars');
        }
    }
};
</script>
