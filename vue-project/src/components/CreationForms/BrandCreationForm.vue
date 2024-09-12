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

            <button class="back-button" @click="goBack">
                <img src="/src/assets/back.svg" alt="volver" class="crud-button"/>
            </button>
            <button class="submit-button" type="submit">
                <img src="/src/assets/save.svg" alt="crear" class="crud-button"/>
            </button>   
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
                details: '',
                disabled: false  // Initialize the disabled field to false
            }
        };
    },
    methods: {
        async createBrand() {
            try {
                // Send a POST request to create the new brand
                await axios.post('http://localhost:8080/api/brands', this.brand);
                // Redirect to the brands list after successful creation
                this.$router.push('/brands');
            } catch (error) {
                console.error('Error creating brand:', error);
            }
        },
        goBack() {
            this.$router.push('/brands');
        }
    }
};
</script>
