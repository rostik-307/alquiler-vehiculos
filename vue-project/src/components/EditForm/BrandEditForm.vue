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

            <button type="submit">Guardar</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'BrandEditForm',
    props: ['id'],
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
                const response = await axios.get(`http://localhost:8080/api/brands/${this.id}`);
                this.brand = response.data;
            } catch (error) {
                console.error('Error fetching brand:', error);
            }
        },
        async updateBrand() {
            try {
                await axios.put(`http://localhost:8080/api/brands/${this.id}`, this.brand);
                this.$router.push('/brands');
            } catch (error) {
                console.error('Error updating brand:', error);
            }
        }
    }
};
</script>