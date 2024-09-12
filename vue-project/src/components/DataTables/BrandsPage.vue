<template>
    <div>
        <h1>
            Marcas
            <button class="crear-button" @click="goToBrandCreationForm">
                <img src="/src/assets/plus.svg" alt="crear" class="crud-button" />
            </button>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>
                        Nombre
                        <button class="sort-button" :class="{ active: sortKey === 'name' }" @click="sort('name')">
                            <span v-if="sortKey === 'name'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th>
                        Año
                        <button class="sort-button" :class="{ active: sortKey === 'year' }" @click="sort('year')">
                            <span v-if="sortKey === 'year'">
                                {{ sortOrder === 'asc' ? '↑' : '↓' }}
                            </span>
                            <span v-else>↕</span>
                        </button>
                    </th>
                    <th class="table-collapse">Detalles</th>
                    <th class="float-right">⠀</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="brand in sortedBrands" :key="brand.id">
                    <td>{{ brand.name }}</td>
                    <td>{{ brand.year }}</td>
                    <td class="table-details table-collapse">{{ brand.details }}</td>
                    <td class="float-right">
                        <button class="details-button" @click="viewBrandDetails(brand.id)">
                            <img src="/src/assets/view.svg" alt="ver" class="crud-button" />
                        </button>
                        <button class="edit-button" @click="editBrand(brand.id)">
                            <img src="/src/assets/edit.svg" alt="editar" class="crud-button" />
                        </button>
                        <button v-if="!(carCounts[brand.id] >= 0)" class="delete-button"
                            @click="confirmDisable(brand.id)">
                            <img src="/src/assets/delete.svg" alt="borrar" class="crud-button" />
                        </button>
                        <button v-else class="disabled-button" disabled>
                            <img src="/src/assets/delete.svg" alt="borrar" class="crud-button disabled-svg" />
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>

        <h2>Marcas Deshabilitadas</h2>
        <table v-if="disabledBrands.length > 0">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Año</th>
                    <th class="table-collapse">Detalles</th>
                    <th class="float-right">⠀</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="brand in disabledBrands" :key="brand.id">
                    <td>{{ brand.name }}</td>
                    <td>{{ brand.year }}</td>
                    <td class="table-details table-collapse">{{ brand.details }}</td>
                    <td class="float-right">
                        <button class="details-button" @click="viewBrandDetails(brand.id)">
                            <img src="/src/assets/view.svg" alt="ver" class="crud-button" />
                        </button>
                        <button class="edit-button" @click="editBrand(brand.id)">
                            <img src="/src/assets/edit.svg" alt="editar" class="crud-button" />
                        </button>
                        <button class="edit-button" @click="confirmEnable(brand.id)">
                            <img src="/src/assets/delete.svg" alt="eliminar" class="crud-button" />
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Confirmation modal -->
        <!-- Confirmation modal -->
        <DeleteConfirmationModal :show="isModalVisible"
            :title="actionType === 'disable' ? 'Confirmar Deshabilitación' : 'Confirmar Habilitación'"
            :message="actionType === 'disable' ? '¿Estás seguro de que quieres deshabilitar esta marca?' : '¿Estás seguro de que quieres habilitar esta marca?'"
            :confirmButtonLabel="actionType === 'disable' ? 'Deshabilitar' : 'Habilitar'" @confirm="confirmAction"
            @cancel="cancelAction" data-cy="confirmation-modal" />

    </div>
</template>

<script>
import axios from 'axios';
import DeleteConfirmationModal from '@/components/Modals/DeleteConfirmationModal.vue';

export default {
    name: 'BrandsPage',
    components: {
        DeleteConfirmationModal
    },
    data() {
        return {
            brands: [],
            carCounts: {},
            sortKey: '',
            sortOrder: 'asc', // 'asc' for ascending, 'desc' for descending
            isModalVisible: false,
            actionType: null, // To differentiate between enabling and disabling
            brandToModify: null,
            errorMessage: ''
        };
    },
    created() {
        this.fetchBrands();
        this.fetchCars();
    },
    computed: {
        sortedBrands() {
            return this.brands
                .filter(brand => !brand.disabled) // Filter out disabled brands
                .sort((a, b) => {
                    if (this.sortKey) {
                        const aValue = a[this.sortKey];
                        const bValue = b[this.sortKey];
                        if (aValue < bValue) return this.sortOrder === 'asc' ? -1 : 1;
                        if (aValue > bValue) return this.sortOrder === 'asc' ? 1 : -1;
                        return 0;
                    }
                    return 0;
                });
        },
        disabledBrands() {
            return this.brands.filter(brand => brand.disabled);
        }
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
        async fetchCars() {
            try {
                const response = await axios.get('http://localhost:8080/api/cars');
                this.cars = response.data;
                this.updateCarCounts(); // Update car counts after fetching cars
            } catch (error) {
                console.error('Error fetching cars:', error);
            }
        },
        updateCarCounts() {
            this.carCounts = this.cars.reduce((counts, car) => {
                counts[car.brand.id] = (counts[car.brand.id] || 0) + 1;
                return counts;
            }, {});
        },
        goToBrandCreationForm() {
            this.$router.push('/brands/create');
        },
        viewBrandDetails(brandId) {
            // Push route with the brand id
            this.$router.push(`/brands/${brandId}`);
        },
        editBrand(brandId) {
            // Push route to edit form with the brand id
            this.$router.push(`/brands/edit/${brandId}`);
        },
        confirmDisable(brandId) {
            this.brandToModify = brandId;
            this.actionType = 'disable';
            this.isModalVisible = true;
            this.errorMessage = '¿Estás seguro de que quieres deshabilitar esta marca?';
        },
        confirmEnable(brandId) {
            this.brandToModify = brandId;
            this.actionType = 'enable';
            this.isModalVisible = true;
            this.errorMessage = '¿Estás seguro de que quieres habilitar esta marca?';
        },
        cancelAction() {
            this.isModalVisible = false;
            this.brandToModify = null; // Reset the selected brand
        },
        async confirmAction() {
            if (this.brandToModify !== null) {
                try {
                    const brand = this.brands.find(brand => brand.id === this.brandToModify);
                    if (this.actionType === 'disable') {
                        await axios.put(`http://localhost:8080/api/brands/${this.brandToModify}/disable`, brand);
                    } else if (this.actionType === 'enable') {
                        await axios.put(`http://localhost:8080/api/brands/${this.brandToModify}/enable`, brand);
                    }
                    this.fetchBrands();
                    this.isModalVisible = false; // Hide the modal after action
                    this.brandToModify = null; // Reset the selected brand
                } catch (error) {
                    console.error('Error modifying brand:', error);
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
