<template>
    <div>
        <h1>
            Coches
            <button class="crear-button" @click="goToCarCreationForm">
                <img src="/src/assets/plus.svg" alt="crear" class="crud-button" />
            </button>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>
                        Marca
                        <button class="sort-button" :class="{ active: sortKey === 'brand.name' }"
                            @click="sort('brand.name')">
                            <span v-if="sortKey === 'brand.name'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th>
                        Modelo
                        <button class="sort-button" :class="{ active: sortKey === 'model' }" @click="sort('model')">
                            <span v-if="sortKey === 'model'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th class="table-collapse2">
                        Año
                        <button class="sort-button" :class="{ active: sortKey === 'year' }" @click="sort('year')">
                            <span v-if="sortKey === 'year'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th class="table-collapse2">
                        Color
                        <button class="sort-button" :class="{ active: sortKey === 'color' }" @click="sort('color')">
                            <span v-if="sortKey === 'color'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th class="table-collapse">
                        Descripción
                    </th>
                    <th class="float-right">⠀</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="car in sortedCars" :key="car.id">
                    <td>{{ car.brand.name }}</td>
                    <td>{{ car.model }}</td>
                    <td class="table-collapse2">{{ car.year }}</td>
                    <td class="table-collapse2">{{ car.color }}</td>
                    <td class="table-collapse">{{ car.description }}</td>
                    <td class="float-right">
                        <button class="details-button" @click="viewCarDetails(car.id)">
                            <img src="/src/assets/view.svg" alt="ver" class="crud-button" />
                        </button>

                        <button class="edit-button" @click="editCar(car.id)">
                            <img src="/src/assets/edit.svg" alt="editar" class="crud-button" />
                        </button>

                        <button class="delete-button" @click="confirmDelete(car.id)">
                            <img src="/src/assets/delete.svg" alt="borrar" class="crud-button" />
                        </button>
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
import DeleteConfirmationModal from '@/components/Modals/DeleteConfirmationModal.vue';
import { useToast } from 'vue-toastification';

export default {
    name: 'CarsPage',
    components: {
        DeleteConfirmationModal
    },
    data() {
        return {
            cars: [],
            sortKey: '',
            sortOrder: 'asc', // 'asc' for ascending, 'desc' for descending
            isModalVisible: false,
            carToDelete: null
        };
    },
    created() {
        this.fetchCars();
    },
    computed: {
        sortedCars() {
            return this.cars
                .sort((a, b) => {
                    if (this.sortKey) {
                        let aValue = a;
                        let bValue = b;

                        // Handle nested keys (for sorting by brand.name)
                        this.sortKey.split('.').forEach(key => {
                            aValue = aValue[key];
                            bValue = bValue[key];
                        });

                        if (aValue < bValue) return this.sortOrder === 'asc' ? -1 : 1;
                        if (aValue > bValue) return this.sortOrder === 'asc' ? 1 : -1;
                        return 0;
                    }
                    return 0;
                });
        }
    },
    methods: {
        async fetchCars() {
            const toast = useToast();
            try {
                const response = await axios.get('http://localhost:8080/api/cars');
                this.cars = response.data;
            } catch (error) {
                console.error('Error fetching cars:', error);
                this.toast.error('Error fetching cars');
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
            this.isModalVisible = true;
        },
        cancelDelete() {
            this.isModalVisible = false;
            this.carToDelete = null;
        },
        async deleteCar() {
            if (this.carToDelete !== null) {
                try {
                    await axios.delete(`http://localhost:8080/api/cars/${this.carToDelete}`);
                    this.cars = this.cars.filter(car => car.id !== this.carToDelete);
                    this.isModalVisible = false;
                    this.carToDelete = null;
                    // this.$toast.success('Coche eliminado correctamente');
                } catch (error) {
                    console.error('Error deleting car:', error);
                    // this.$toast.error('Error al borrar el coche');
                }
            }
        },

        sort(key) {
            if (this.sortKey === key) {
                this.sortOrder = this.sortOrder === 'asc' ? 'desc' : 'asc';
            } else {
                this.sortKey = key;
                this.sortOrder = 'asc';
            }
        }
    }
};
</script>

<style scoped>
/* Add some basic styling for the sort buttons */
.sort-button {
    margin-left: 5px;
    background: none;
    border: none;
    cursor: pointer;
    color: grey;
    /* Default color when not active */
}

.sort-button.active {
    color: black;
    /* Highlighted color when active */
}

/* Style the up and down arrows */
.sort-button span {
    font-size: 16px;
}
</style>
