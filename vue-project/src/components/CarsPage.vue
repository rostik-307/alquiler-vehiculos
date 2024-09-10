<template>
    <div>
        <h1>
            Coches
            <button class="crear-button" @click="goToCarCreationForm">Crear Coche</button>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Año</th>
                    <th>Color</th>
                    <th>Descripción</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="car in cars" :key="car.id">
                    <td>{{ car.brand.name }}</td>
                    <td>{{ car.model }}</td>
                    <td>{{ car.year }}</td>
                    <td>{{ car.color }}</td>
                    <td>{{ car.description }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';
import { useRouter } from 'vue-router';

export default {
    name: 'CarsPage',
    data() {
        return {
            cars: []
        };
    },
    created() {
        this.fetchCars();
    },
    methods: {
        async fetchCars() {
            try {
                const response = await axios.get('http://localhost:8080/api/cars');
                this.cars = response.data;
            } catch (error) {
                console.error('Error fetching cars:', error);
            }
        },
        goToCarCreationForm() {
            this.$router.push('/cars/create');
        }
    }
};
</script>
