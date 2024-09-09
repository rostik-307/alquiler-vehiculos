<template>
    <div>
        <h1>Coches</h1>
        <table>
            <thead>
                <tr>
                    <th>Modelo</th>
                    <th>Año</th>
                    <th>Color</th>
                    <th>Descripción</th>
                    <th>Marca</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="car in cars" :key="car.idCar">
                    <td>{{ car.model }}</td>
                    <td>{{ car.year }}</td>
                    <td>{{ car.color }}</td>
                    <td>{{ car.description }}</td>
                    <td>{{ car.brand.name }}</td>
                </tr>
            </tbody>
        </table>
        <button @click="goToCarCreationForm">Crear Coche</button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            cars: [],
        };
    },
    mounted() {
        this.fetchCars();
    },
    methods: {
        fetchCars() {
            axios.get('/api/cars').then(response => {
                this.cars = response.data;
            });
        },
        goToCarCreationForm() {
            this.$router.push('/create-car');
        },
    },
};
</script>