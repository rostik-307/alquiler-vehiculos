<template>
    <div class="creation-form">
        <h1>Crear Marca</h1>
        <form @submit.prevent="createBrand">
            <label for="name">Nombre de la Marca:</label>
            <input type="text" v-model="brand.name" id="name" required />

            <label for="year">Año de Fundación:</label>
            <input type="number" v-model="brand.year" id="year" min="1800" max="3000" required />

            <label for="details">Detalles:</label>
            <input type="text" v-model="brand.details" id="details" />

            <button type="submit">Guardar</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandCreationForm',
    data() {
        return {
            brand: {
                name: '',
                year: '',
                details: ''
            }
        };
    },
    methods: {
        async createBrand() {
            try {
                await axios.post('http://localhost:8080/api/brands', this.brand);
                this.$router.push('/brands');
            } catch (error) {
                console.error('Error creating brand:', error);
            }
        }
    }
};
</script>