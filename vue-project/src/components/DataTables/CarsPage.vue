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
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="car in cars" :key="car.id">
                    <td>{{ car.brand.name }}</td>
                    <td>{{ car.model }}</td>
                    <td>{{ car.year }}</td>
                    <td>{{ car.color }}</td>
                    <td>{{ car.description }}</td>
                    <td>
                        <button class="details-button" @click="viewCarDetails(car.id)">Detalles</button>
                        <button class="edit-button" @click="editCar(car.id)">Editar</button>
                        <button class="delete-button" @click="confirmDelete(car.id)">Eliminar</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Delete confirmation modal -->
        <DeleteConfirmationModal :show="isModalVisible" @confirm="deleteCar" @cancel="cancelDelete" />
    </div>
</template>

<script>
import axios from 'axios';
import { useRouter } from 'vue-router';
import DeleteConfirmationModal from '@/components/Modals/DeleteConfirmationModal.vue';

export default {
    name: 'CarsPage',
    components: {
        DeleteConfirmationModal
    },
    data() {
        return {
            cars: [],
            isModalVisible: false,
            carToDelete: null
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
        },
        viewCarDetails(carId) {
            this.$router.push(`/cars/${carId}`);
        },
        editCar(carId) {
            this.$router.push(`/cars/edit/${carId}`);
        },
        confirmDelete(carId) {
            this.carToDelete = carId;
            this.isModalVisible = true; // Show the modal
        },
        cancelDelete() {
            this.isModalVisible = false;
            this.carToDelete = null; // Reset the selected car
        },
        async deleteCar() {
            if (this.carToDelete !== null) {
                try {
                    await axios.delete(`http://localhost:8080/api/cars/${this.carToDelete}`);
                    this.cars = this.cars.filter(car => car.id !== this.carToDelete);
                    this.isModalVisible = false; // Hide the modal after deletion
                    this.carToDelete = null; // Reset the selected car
                } catch (error) {
                    console.error('Error deleting car:', error);
                }
            }
        }
    }
};
</script>