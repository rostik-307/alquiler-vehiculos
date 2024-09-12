<template>
    <div class="details">
        <h1>Detalles del Coche</h1>
        <p><strong>Marca:</strong> {{ car.brand.name }}</p>
        <p><strong>Modelo:</strong> {{ car.model }}</p>
        <p><strong>Año:</strong> {{ car.year }}</p>
        <p><strong>Color:</strong> {{ car.color }}</p>
        <p><strong>Descripción:</strong> {{ car.description }}</p>
        <button class="edit-button" @click="goBack">
            <img src="/src/assets/back.svg" alt="atras" class="crud-button"/>
        </button>
    </div>
</template>

<script>
import axios from 'axios';
import { useRouter } from 'vue-router';

export default {
    name: 'CarDetails',
    props: ['id'],
    data() {
        return {
            car: {}
        };
    },
    created() {
        this.fetchCar();
    },
    methods: {
        async fetchCar() {
            try {
                const response = await axios.get(`http://localhost:8080/api/cars/${this.id}`);
                this.car = response.data;
            } catch (error) {
                console.error('Error fetching car details:', error);
            }
        },
        goBack() {
            this.$router.push('/cars');
        }
    }
};
</script>
